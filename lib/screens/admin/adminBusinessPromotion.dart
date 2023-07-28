import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminBusinessPromotion extends StatefulWidget {
  const AdminBusinessPromotion({Key? key}) : super(key: key);

  @override
  State<AdminBusinessPromotion> createState() => _AdminBusinessPromotionState();
}

class _AdminBusinessPromotionState extends State<AdminBusinessPromotion> {
  final TextEditingController _BusinessNameController = TextEditingController();
  final TextEditingController _phoneController =
  TextEditingController();
  final TextEditingController _businessDescriptionControler = TextEditingController();
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
    if (_BusinessNameController.text.isEmpty ||
        _businessDescriptionControler.text.isEmpty ||
        _phoneController.text.isEmpty ||
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
    firebase_storage.FirebaseStorage.instance.ref().child('promo_images');
    firebase_storage.UploadTask uploadTask =
    storageRef.child('${DateTime.now()}.jpg').putFile(_imageFile!);
    firebase_storage.TaskSnapshot snapshot = await uploadTask;
    String imageUrl = await snapshot.ref.getDownloadURL();

    // Save data to Firestore
    await _firestore.collection('promotions').add({
      'businessName': _BusinessNameController.text,
      'phone': _phoneController.text,
      'immageUrl': imageUrl,
      'businessDescription': _businessDescriptionControler.text
    });

    // Reset the form
    _BusinessNameController.clear();
    _phoneController.clear();
    _businessDescriptionControler.clear();
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
    _BusinessNameController.dispose();
    _phoneController.dispose();
    _businessDescriptionControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.indigo,
        title: const Text("PROMOTION B/S Page"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, 'adminHomePage');
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
              TextField(
                textInputAction: TextInputAction.next,
                controller: _BusinessNameController,
                decoration: const InputDecoration(
                  labelText: 'Business Name',
                  hintText: 'Enter business name',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                textInputAction: TextInputAction.next,
                controller: _businessDescriptionControler,
                decoration: const InputDecoration(
                  labelText: 'Business Description',
                  hintText: 'Enter business Description',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.phone,
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: 'phone',
                  hintText: 'Enter phone',
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _pickImage,
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo
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
                    backgroundColor: Colors.indigo
                ),
                child: const Text('Upload Data'),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}