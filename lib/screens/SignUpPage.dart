import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scholar_hub/models/users.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  //form key
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  //FirebaseAuth
  final _auth = FirebaseAuth.instance;
  final TextEditingController _confirmPasswordEditingController =
      TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();
  final TextEditingController _userNameEditingController =
      TextEditingController();
  final TextEditingController _emailEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 10.0),
            child: Column(
              children: [
                const Text(
                  'REGISTER',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
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
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailEditingController,
                          cursorColor: Colors.black,
                          autofillHints: const <String>[
                            '@gmail.com',
                            'mwichabecollins@gmail.com'
                          ],
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: Colors.green.shade100)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: Colors.green.shade100)),
                              hintText: 'Gmail',
                              prefixIcon: const Icon(
                                Icons.email,
                                color: Colors.black,
                              )),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ('Please enter your email');
                            }
                            //reg expression
                            if (!RegExp(
                                    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(value)) {
                              return ("Please enter a valid email");
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.name,
                          controller: _userNameEditingController,
                          cursorColor: Colors.black,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: Colors.green.shade100)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: Colors.green.shade100)),
                              hintText: 'Username',
                              prefixIcon: const Icon(
                                Icons.person,
                                color: Colors.black,
                              )),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ('Username Required!');
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          controller: _passwordEditingController,
                          obscureText: true,
                          cursorColor: Colors.black,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: Colors.green.shade100)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: Colors.green.shade100)),
                              hintText: 'Password',
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Colors.black,
                              )),
                          validator: (value) {
                            RegExp regex = RegExp(
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#&*~]).{6,}$');
                            if (value!.isEmpty) {
                              return ("Password is required");
                            }
                            if (!regex.hasMatch(value)) {
                              return ' Password must be at least 6 characters \n'
                                  ' Include: \n '
                                  'Uppercase. \n'
                                  'Number & symbol.\n'
                                  'eg Scholar@0';
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.text,
                          controller: _confirmPasswordEditingController,
                          obscureText: true,
                          cursorColor: Colors.black,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: Colors.green.shade100)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: Colors.green.shade100)),
                              hintText: 'Confirm password',
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Colors.black,
                              )),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please confirm your password';
                            }
                            if (value != _passwordEditingController.text) {
                              return 'Your password does not match';
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        const SizedBox(
                          height: 16,
                        )
                      ],
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: ElevatedButton(
                          onPressed: () {
                            register(_emailEditingController.text,
                                _passwordEditingController.text);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black),
                          child: const Text(
                            'REGISTER',
                            style: TextStyle(color: Colors.green),
                          )),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/logIn');
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green),
                        child: const Text(
                          'LOG IN',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  addUsers() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserModel userModel = UserModel();
    //sending content
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.userName = _userNameEditingController.text;
    await firestore
        .collection('users')
        .doc(user.uid)
        .set(userModel.toMap())
        .then((value) => Navigator.pushReplacementNamed(context, 'initialProfile'));

    Fluttertoast.showToast(
      msg: 'Account created successfully',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.green,
      timeInSecForIosWeb: 1,
      fontSize: 16,
    );
  }

  void register(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      await _auth
          .createUserWithEmailAndPassword(
              email: _emailEditingController.text,
              password: _passwordEditingController.text)
          .then((value) => addUsers())
          .catchError((e) {
        print('Registering error: $e');
        Fluttertoast.showToast(
          msg:
              'An error occurred during registration. Check Network Connectivity',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          timeInSecForIosWeb: 1,
          fontSize: 16,
        );
      });
    }
    setState(() {
      isLoading = false;
    });
  }
}
