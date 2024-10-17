import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/rendering.dart'; // Required for RepaintBoundary

class PhotoWallAppWithAI extends StatefulWidget {
  @override
  _PhotoWallAppWithAIState createState() => _PhotoWallAppWithAIState();
}

class _PhotoWallAppWithAIState extends State<PhotoWallAppWithAI> with SingleTickerProviderStateMixin {
  File? _image; // To store the selected image
  Color wallColor = Colors.white; // Default wall color
  List<Color> suggestedColors = []; // List of AI-suggested colors
  final ImagePicker _picker = ImagePicker();
  bool _isLoading = false; // Loading state for color extraction
  double _imageOpacity = 0; // Opacity for fade animation
  final GlobalKey _globalKey = GlobalKey(); // Global key for RepaintBoundary

  // Function to pick an image from the camera
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        _imageOpacity = 0; // Reset opacity for fade animation
        _isLoading = true; // Start loading when picking an image
      });
      await _extractDominantColors(); // Extract colors after picking an image
    }
  }

  // Function to extract dominant colors using PaletteGenerator
  Future<void> _extractDominantColors() async {
    if (_image == null) return;

    final paletteGenerator = await PaletteGenerator.fromImageProvider(
      FileImage(_image!),
      maximumColorCount: 5, // Number of colors to suggest
    );

    setState(() {
      suggestedColors = paletteGenerator.colors.toList();
      _isLoading = false; // Stop loading once colors are extracted
      _imageOpacity = 1; // Fade in the image
    });
  }

  // Function to show color picker manually
  void _pickWallColor() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pick a wall color'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: wallColor,
              onColorChanged: (Color color) {
                setState(() {
                  wallColor = color; // Update wall color in real-time
                });
              },
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text('Select'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // Function to show preview of export settings
  void _previewExport() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text('Export Preview'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Text('Selected Wall Color:', style: TextStyle(fontWeight: FontWeight.bold)),
                  Container(
                    height: 50,
                    width: 50,
                    color: wallColor,
                  ),
                  SizedBox(height: 20),
                  Text('Suggested Wall Colors:', style: TextStyle(fontWeight: FontWeight.bold)),
                  Wrap(
                    spacing: 10.0,
                    children: suggestedColors.map((color) {
                      return Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: color,
                          shape: BoxShape.circle,
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            actions: [
            TextButton(
            onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text('Close'),
        ),
        TextButton(
        onPressed: () {
        _sharePreview(); // Trigger share function
        },
        child: Text('Share'),
        ),
        TextButton(
        onPressed: () {
        _savePreview(); // Trigger save function
        },
        child: Text('Save'),
        )

      ],
    );
  },
  );
}

// Function to share the preview settings
void _sharePreview() {
  final String shareContent = '''
    I'm sharing my wall color settings!
    Selected Wall Color: ${wallColor.toString()}
    Suggested Wall Colors: ${suggestedColors.map((color) => color.toString()).join(", ")}
    ''';

  Share.share(shareContent, subject: 'Wall Color Settings');
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Settings shared!')));
}

// Function to save the preview as an image
Future<void> _savePreview() async {
  // Ensure that the widget has been rendered
  if (_globalKey.currentContext == null) return;

  final RenderRepaintBoundary boundary = _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
  final image = await boundary.toImage(pixelRatio: 3.0);
  final byteData = await image.toByteData(format: ImageByteFormat.png);
  final pngBytes = byteData!.buffer.asUint8List();

  // Get the app's document directory
  final directory = await getApplicationDocumentsDirectory();
  final path = '${directory.path}/preview.png';

  // Save the image
  final file = File(path);
  await file.writeAsBytes(pngBytes);

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Preview saved to gallery!')),
  );
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('AI-Based Wall Color Suggestion'),
      actions: [
        IconButton(
          icon: Icon(Icons.preview),
          onPressed: _previewExport, // Trigger preview export
        ),
      ],
    ),
    body: RepaintBoundary( // Wrap the main UI in a RepaintBoundary for real-time visualization
      key: _globalKey, // Assign the global key here
      child: Container(
        color: wallColor, // Wall color set dynamically
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AnimatedOpacity( // Fade in the image
                opacity: _imageOpacity,
                duration: Duration(milliseconds: 500),
                child: _image != null
                    ? ClipOval( // Circular image preview
                  child: SizedBox(
                    height: 300,
                    width: 300,
                    child: Image.file(_image!, fit: BoxFit.cover), // Display the selected image
                  ),
                )
                    : Text('No image selected.'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _pickImage, // Take a photo
                child: Text('Take a Photo'),
              ),
              SizedBox(height: 10),
              Text('Suggested Wall Colors:'),
              _isLoading
                  ? CircularProgressIndicator() // Loading indicator
                  : _buildColorSuggestions(), // Display AI-suggested colors
            ],
          ),
        ),
      ),
    ),
  );
}

// Build UI to show suggested colors
Widget _buildColorSuggestions() {
  if (suggestedColors.isEmpty) {
    return Text('No suggestions yet.');
  }

  return Wrap(
    spacing: 10.0,
    children: suggestedColors.map((color) {
      return GestureDetector(
        onTap: () {
          setState(() {
            wallColor = color; // Set the selected AI-suggested color as the wall color
          });
        },
        child: AnimatedContainer( // Animate color suggestion scaling
          duration: Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black.withOpacity(0.2), width: 2), // Subtle border for colors
          ),
        ),
      );
    }).toList(),
  );
}
}

void main() => runApp(MaterialApp(
  home: PhotoWallAppWithAI(),
));
