import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scholar_hub/constants/Global.dart';

import '../models/users.dart';
class InitialProfile extends StatefulWidget {
  const InitialProfile({Key? key}) : super(key: key);

  @override
  State<InitialProfile> createState() => _InitialProfileState();
}

class _InitialProfileState extends State<InitialProfile> {
  bool isLoading=false;
  final _formKey = GlobalKey<FormState>();
  User? user = FirebaseAuth.instance.currentUser;

  UserModel loggedInUser = UserModel(uid: '');
  bool isImageSelected = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((value){
      loggedInUser= UserModel.fromMap(value.data());
      setState((){});
    });
  }

  //pick image
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
  //controllers
  TextEditingController phoneNumberController= TextEditingController();
  TextEditingController hobbiesEditingController= TextEditingController();


  @override
  Widget build(BuildContext context) {
    return  Scaffold
      (
        body:
        LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints)
            {
              return Container(
                height: constraints.maxHeight,
                decoration: const BoxDecoration
                  (
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end:  Alignment.centerRight,
                        colors: [Global.primaryColor,Global.secondaryColor])
                ),
                child: SingleChildScrollView
                  (
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 60, 20, 40,),
                    child: Column
                      (
                      children:
                      [
                        Center(
                          child: Container
                            (
                            width: 200,
                            decoration: const BoxDecoration
                              (
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                            ),
                            child: const Padding(
                              padding:  EdgeInsets.fromLTRB(2, 2,10,2),
                              child: Row
                                (
                                children:
                                [
                                  Icon(Icons.person,color: Colors.white,),
                                  SizedBox(width: 5,),
                                  Text('SetUp your Profile',style: TextStyle(color: Colors.black),),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Stack
                          (
                          children:
                          [
                            CircleAvatar
                              (
                              radius: 64,
                              backgroundColor: Colors.white,
                              child: ClipOval
                                (
                                child: SizedBox
                                  (
                                    height: 180,
                                    width: 180,
                                    child: _image != null
                                        ? Image.file(
                                      _image!,
                                      fit: BoxFit.fill,
                                      height: 180,
                                      width: 180,
                                    )
                                        :
                                    Image.network(
                                      loggedInUser.profilePictureUrl ?? 'https://firebasestorage.googleapis.com/v0/b/scholar-hub-5966a.appspot.com/o/Icons%2FpersonIcon.jpeg?alt=media&token=0496c08d-e931-493d-a7a5-a6103264fcd1',
                                      fit: BoxFit.cover,
                                      width: 140,
                                      height: 140,
                                      errorBuilder: (context, error, stackTrace) => const Text('Check \n your network'),
                                    )
                                ),
                              ),
                            ),
                            Positioned(bottom: -10,
                              left: 80,child: IconButton
                                (
                                  onPressed: _pickImage,
                                  icon: const CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.white,
                                    child: Icon(
                                      Icons.add_a_photo,
                                      color: Colors.black,
                                    ),
                                  )
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15,),
                        Row
                          (
                          children:
                          [
                            const Icon(Icons.person_2_outlined, color: Colors.black,),
                            const SizedBox(width: 3,),
                            Text('${loggedInUser.userName}',style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
                          ],
                        ),
                        const Divider(color: Colors.grey,),
                        const SizedBox(height: 10,),
                        Form(
                            key: _formKey,
                            child: Column
                              (
                              children:
                              [
                                TextFormField
                                  (
                                  style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),
                                  controller: phoneNumberController,
                                  cursorColor: Colors.white,
                                  keyboardType: TextInputType.phone,
                                  textInputAction: TextInputAction.done,
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  validator: (value)
                                  {
                                    if(value!.isEmpty)
                                    {
                                      return 'Field required';
                                    }
                                    return null;
                                  },
                                  decoration:  InputDecoration
                                    (
                                      helperText: "Enter your number: 2547",
                                      enabledBorder: const UnderlineInputBorder
                                        (
                                          borderSide: BorderSide
                                            (
                                              color: Colors.grey
                                          )
                                      ),
                                      focusedBorder: OutlineInputBorder
                                        (
                                          borderSide: const BorderSide(
                                            color: Colors.grey,
                                          ),
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      hoverColor: Colors.white,
                                      label: const Text('Phone number',style: TextStyle(color: Colors.white),),
                                      prefixIcon: const Icon(Icons.phone,color: Colors.black,)

                                  ),
                                ),
                                const SizedBox(height: 10,),
                                TextFormField
                                  (
                                  style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),
                                  controller: hobbiesEditingController,
                                  cursorColor: Colors.white,
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.done,
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  validator: (value)
                                  {
                                    if(value!.isEmpty)
                                    {
                                      return 'Field required';
                                    }
                                    return null;
                                  },
                                  decoration:  InputDecoration
                                    (
                                      helperText: "Enter your hobby",
                                      enabledBorder: const UnderlineInputBorder
                                        (
                                          borderSide: BorderSide
                                            (
                                              color: Colors.grey
                                          )
                                      ),
                                      focusedBorder: OutlineInputBorder
                                        (
                                          borderSide: const BorderSide(
                                            color: Colors.grey,
                                          ),
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      hoverColor: Colors.white,
                                      label: const Text('Hobbies',style: TextStyle(color: Colors.white),),
                                      prefixIcon: const Icon(Icons.headphones,color: Colors.black,)

                                  ),
                                ),
                                const SizedBox(height: 25,),
                              ],
                            )
                        ),
                        Stack
                          (
                          alignment: Alignment.center,
                          children:
                          [
                            ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    isLoading=true ;
                                  });
                                  String UniqueFileName = DateTime.now().millisecond.toString();
                                  Reference referenceRoot = FirebaseStorage.instance.ref();
                                  Reference referenceDirImage = referenceRoot.child('images');
                                  Reference referenceImageToUpload = referenceDirImage.child(UniqueFileName);
                                  try {
                                    await referenceImageToUpload.putFile(_image!);
                                    String imageUrl = await referenceImageToUpload.getDownloadURL();
                                    loggedInUser.profilePictureUrl = imageUrl;
                                    loggedInUser.phoneNumber=phoneNumberController.text;
                                    loggedInUser.hobbies=hobbiesEditingController.text;
                                    await FirebaseFirestore.instance.collection('users')
                                        .doc(user!.uid)
                                        .update(loggedInUser.toMap());
                                    Navigator.pushReplacementNamed(context, 'home');
                                    Fluttertoast.showToast(msg: 'Profile photo and information updated successfully',
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      backgroundColor: Colors.green,
                                      timeInSecForIosWeb: 1,
                                      fontSize: 16,);
                                  } catch (err) {
                                    Fluttertoast.showToast(msg: 'No image selected, please update your profile photo.');
                                  }
                                } else {
                                  Fluttertoast.showToast(msg: 'Unable to upload your data Please fill the required fields',
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.red,
                                    timeInSecForIosWeb: 1,
                                    fontSize: 16,);
                                }
                                setState(() {
                                  isLoading=false;
                                });
                              },
                              style: ElevatedButton.styleFrom
                                (
                                backgroundColor: Colors.black,
                              ),


                              child: const Text('SAVE'),),
                            if (isLoading)
                              const CircularProgressIndicator(),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            }


        )

    );
  }
}
