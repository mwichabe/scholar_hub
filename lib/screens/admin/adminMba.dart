import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminMba extends StatefulWidget {
  const AdminMba({Key? key}) : super(key: key);

  @override
  State<AdminMba> createState() => _AdminMbaState();
}

class _AdminMbaState extends State<AdminMba> {
  final TextEditingController _paperNameController = TextEditingController();
  final TextEditingController _paperUnitCodeController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  File? _imageFile;
  final picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _imageFile = File(pickedImage.path);
      });
    }
  }

  Future<void> _uploadData() async {
    if (_paperNameController.text.isEmpty ||
        _imageFile == null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Incomplete Form'),
            content:
            const Text('Please fill in all fields and select an image.'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return;
    }

    // Upload image to Firebase Storage
    firebase_storage.Reference storageRef =
    firebase_storage.FirebaseStorage.instance.ref().child('past_papers_images');
    firebase_storage.UploadTask uploadTask =
    storageRef.child('${DateTime.now()}.jpg').putFile(_imageFile!);
    firebase_storage.TaskSnapshot snapshot = await uploadTask;
    String imageUrl = await snapshot.ref.getDownloadURL();

    // Save data to Firestore
    await _firestore.collection('mbaPastPapers').add({
      'paperName': _paperNameController.text,
      'unitCode': _paperUnitCodeController.text,
      'imageUrl': imageUrl,

    });

    // Reset the form
    _paperNameController.clear();
    setState(() {
      _imageFile = null;
    });

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Success'),
          content: const Text('Club data has been uploaded successfully.'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _paperNameController.dispose();
    _paperUnitCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Upload Mba Past Paper"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.close,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, 'home');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //
              TextField(
                style: TextStyle(color: Colors.white),
                textInputAction: TextInputAction.next,
                controller: _paperNameController,
                decoration: const InputDecoration(
                  labelText: 'Mba Name',
                  labelStyle: TextStyle(color: Colors.white),
                  hintText: 'Enter Mba Past Paper name',
                  hintStyle: TextStyle(color: Colors.white)
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                style: TextStyle(color: Colors.white),
                textInputAction: TextInputAction.next,
                controller: _paperUnitCodeController,
                decoration: const InputDecoration(
                  labelText: 'Mba Unit Code',
                  labelStyle: TextStyle(color: Colors.white),
                  hintText: 'Enter Mba Unit Code',
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _pickImage,
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                ),
                child: const Text('Select Image'),
              ),
              const SizedBox(height: 16),
              _imageFile != null
                  ? Image.file(
                _imageFile!,
                height: 200,
              )
                  : const SizedBox(),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _uploadData,
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green
                ),
                child: const Text('Upload Data'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}