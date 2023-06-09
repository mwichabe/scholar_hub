import 'dart:io';

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
  bool isImageSelected = false;

  File? _image;
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
        isImageSelected = true;
      });
    }
    print('$_image');
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
                          child: _image != null
                              ? Image.file(
                                  _image!,
                                  fit: BoxFit.fill,
                                  height: 180,
                                  width: 180,
                                )
                              : const Icon(
                                  CupertinoIcons.person,
                                  size: 40,
                                )),
                    ),
                  ),
                  Positioned(
                    child: IconButton(
                        onPressed: _pickImage,
                        icon: const CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.add_a_photo,
                            color: Colors.black,
                          ),
                        )),
                    bottom: -10,
                    left: 80,
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
                          hintText: 'Enter your email',
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
                          hintText: 'Enter your name',
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
                      const SizedBox(height: 20,)
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                width: 120,
                child: ElevatedButton(
                  onPressed: () {},
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
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
