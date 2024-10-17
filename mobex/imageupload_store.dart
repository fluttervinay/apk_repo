import 'dart:io';
import 'dart:convert'; // Import to decode the response body
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:path/path.dart' as p;

part 'imageupload_store.g.dart';

class ImageuploadStore = _Imageuploadstore with _$ImageuploadStore;

abstract class _Imageuploadstore with Store {
  @observable
  File? imageFile;

  @observable
  bool isLoading = false;

  @observable
  String errorMessage = '';

  @action
  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
    } else {
      errorMessage = 'No image selected.';
    }
  }

  @action
  Future<void> uploadImage() async {
    if (imageFile == null) {
      errorMessage = 'Please select an image first.';
      return;
    }

    isLoading = true;
    errorMessage = '';

    try {
      final request = http.MultipartRequest(
        'POST',
        Uri.parse('https://api.escuelajs.co/api/v1/files/upload'),
      );

      request.files.add(
        await http.MultipartFile.fromPath(
          'file',
          imageFile!.path,
          filename: p.basename(imageFile!.path),
        ),
      );

      final response = await request.send();

      if (response.statusCode == 201) {
        // Read and decode the response
        final responseBody = await response.stream.bytesToString();
        final jsonData = jsonDecode(responseBody);
        errorMessage='Image uploaded successfully';
        final uploadedImageUrl = jsonData['location'];
        print('Image uploaded successfully: $uploadedImageUrl');
      } else {
        errorMessage = 'Failed to upload image. Status code: ${response.statusCode}';
        print(errorMessage);
      }
    } catch (e) {
      errorMessage = 'Error: ${e.toString()}';
      print(errorMessage);
    } finally {
      isLoading = false;
    }
  }
}
