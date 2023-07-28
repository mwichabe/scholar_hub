import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:scholar_hub/constants/Global.dart';
import 'package:image_picker/image_picker.dart';

class PostVideo extends StatefulWidget {
  const PostVideo({Key? key}) : super(key: key);

  @override
  State<PostVideo> createState() => _PostVideoState();
}

class _PostVideoState extends State<PostVideo> {
  final ImagePicker _picker = ImagePicker();
  File? _imageFile;

  Future<void> _pickImageFromGallery() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        aspectRatio: const CropAspectRatio(ratioX: 16, ratioY: 9),
        compressQuality: 70, // Adjust the quality as needed
        maxWidth: 600, // Adjust the maximum width as needed
        maxHeight: 350, // Adjust the maximum height as needed
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Cropper',
          )
        ],
      );

      if (croppedFile != null) {
        setState(() {
          _imageFile = croppedFile as File?;
        });
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Global.primaryColor,
        title: const Text('Post Images'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 1,
                child: _imageFile != null
                    ? Image.file(_imageFile!,fit: BoxFit.cover,height: 350,width: 600,)
                    : const Icon(
                  Icons.image,
                  size: 100,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 10,),
              ElevatedButton(
                onPressed: _pickImageFromGallery,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.black,
                ),
                child: const Text('Select meme from Gallery'),
              ),
              ElevatedButton(
                onPressed: () {
                  // TODO: Implement the logic to post the image to your backend or storage.
                  // You can use the selected/taken image from _imageFile.
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.black,
                ),
                child: const Text('Post Image'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
