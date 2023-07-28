import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final currentUser = FirebaseAuth.instance.currentUser;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  // text controllers
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController userNameEditingController = TextEditingController();
  TextEditingController phoneEditingController = TextEditingController();
  // image details
  final ImagePicker _picker = ImagePicker();
  File? _imageFile;
  //methods
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  //upload image
  Future<String?> _uploadImage(File file) async {
    try {
      final String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      final Reference reference = _storage.ref().child('user_images/$fileName');
      final UploadTask uploadTask = reference.putFile(file);
      final TaskSnapshot storageTaskSnapshot =
          await uploadTask.whenComplete(() {});

      final imageUrl = await storageTaskSnapshot.ref.getDownloadURL();
      return imageUrl;
    } catch (e) {
      print('Error uploading image: $e');
      return null;
    }
  }

  // update data in firestore
  Future<void> _updateUserProfile() async {
    if (_formKey.currentState!.validate()) {
      try {
        // Upload image if available
        String? imageUrl;
        if (_imageFile != null) {
          imageUrl = await _uploadImage(_imageFile!);
        }

        // Update user details in Firestore
        final userRef = _firestore.collection('users');
        await userRef.add({
          'email': emailEditingController.text,
          'userName': userNameEditingController.text,
          'phone': phoneEditingController.text,
          'profilePictureUrl': imageUrl,
        });

        // Show success message
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Success'),
              content: const Text('Profile updated successfully.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Error'),
              content: Text('Failed to update profile: $e'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text('Profile Page'),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, 'home');
              },
              icon: const Icon(
                Icons.close,
                color: Colors.black,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Column(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 64,
                    backgroundColor: Colors.white,
                    child: ClipOval(
                      child: SizedBox(
                        height: 180,
                        width: 180,
                        child: _imageFile != null
                            ? Image.file(
                                _imageFile!,
                                fit: BoxFit.cover,
                              )
                            : Center(
                              child: const Text(
                                  ' Upload \n image',
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.black),
                                ),
                            ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                        onPressed: () {
                          _pickImage();
                        }, //_pickImage,
                        icon: const CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.add_a_photo,
                            color: Colors.black,
                          ),
                        )),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailEditingController,
                        cursorColor: Colors.black,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        autofocus: true,
                        //autovalidateMode: true,
                        validator: (value) {},
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.green.shade200,
                          border: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'Update your email',
                          hintStyle: TextStyle(color: Colors.grey[600]),
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: userNameEditingController,
                        cursorColor: Colors.black,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        autofocus: true,
                        //autovalidateMode: true,
                        validator: (value) {},
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.green.shade200,
                          border: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'Update your Username',
                          hintStyle: TextStyle(color: Colors.grey[600]),
                          prefixIcon: const Icon(
                            CupertinoIcons.person,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: phoneEditingController,
                        cursorColor: Colors.black,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.phone,
                        autofocus: true,
                        //autovalidateMode: true,
                        validator: (value) {},
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.green.shade200,
                            border: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: 'Enter your phone',
                            hintStyle: TextStyle(color: Colors.grey[600]),
                            prefixIcon: const Icon(
                              Icons.phone_outlined,
                              color: Colors.black,
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                width: 120,
                child: ElevatedButton(
                  onPressed: () {
                    _updateUserProfile();
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: const Row(
                    children: [
                      Icon(
                        CupertinoIcons.up_arrow,
                        color: Colors.black,
                      ),
                      Text(
                        'UPDATE',
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
