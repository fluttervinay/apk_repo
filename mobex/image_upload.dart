import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tmp/mobex/imageupload_store.dart';


class ImageUploadScreen extends StatefulWidget {
  @override
  _ImageUploadScreenState createState() => _ImageUploadScreenState();
}

class _ImageUploadScreenState extends State<ImageUploadScreen> {

  final ImageuploadStore imageUploadStore = ImageuploadStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Upload with MobX'),
      ),
      body: Observer(
        builder: (_) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (imageUploadStore.imageFile != null)
                  Image.file(imageUploadStore.imageFile!),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: imageUploadStore.pickImage,
                      child: Text('Pick Image'),
                    ),

                    if (imageUploadStore.isLoading)
                      CircularProgressIndicator()
                    else
                      ElevatedButton(
                        onPressed: imageUploadStore.uploadImage,
                        child: Text('Upload Image'),
                      ),
                  ],
                ),
                const SizedBox(height: 20),
                if (imageUploadStore.errorMessage.isNotEmpty)
                  Text(
                    imageUploadStore.errorMessage,
                    style: TextStyle(color: Colors.red),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
