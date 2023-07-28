import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scholar_hub/widgets/buttonWidget.dart';
import 'package:scholar_hub/widgets/textField.dart';
import 'package:scholar_hub/widgets/waveWidgets.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  //controller
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  @override
  void dispose() {
    _emailEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.green,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                children: [
                  const Text(
                    'LOG IN',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  Stack(
                    children: [
                      Container(
                        height: size.height - 200,
                        color: Colors.green,
                      ),
                      WaveWidgets(
                        size: size,
                        yOffset: size.height / 3.0,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextFormField(
                                controller: _emailEditingController,
                                cursorColor: Colors.black,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: 'Email',
                                  prefixIcon: const Icon(
                                    Icons.mail_lock_outlined,
                                    size: 18,
                                    color: Colors.black,
                                  ),
                                  filled: true,
                                  enabledBorder: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        const BorderSide(color: Colors.white38),
                                  ),
                                  labelStyle:
                                      const TextStyle(color: Colors.white60),
                                  focusColor: Colors.white60,
                                ),
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
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: _passwordEditingController,
                                cursorColor: Colors.black,
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  prefixIcon: const Icon(
                                    Icons.mail_lock_outlined,
                                    size: 18,
                                    color: Colors.black,
                                  ),
                                  filled: true,
                                  enabledBorder: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        const BorderSide(color: Colors.white38),
                                  ),
                                  labelStyle:
                                      const TextStyle(color: Colors.white60),
                                  focusColor: Colors.white60,
                                ),
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
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                  ),
                                  onPressed: () {
                                    signIn(
                                      _emailEditingController.text,
                                      _passwordEditingController.text,
                                    );
                                  },
                                  child: const Text(
                                    'LOGIN',
                                    style: TextStyle(color: Colors.green),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ButtonWidget(
                                title: 'Sign Up',
                                hasBoader: true,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }

  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(
              email: _emailEditingController.text,
              password: _passwordEditingController.text)
          .then((uid) => {
                Navigator.pushReplacementNamed(context, 'home'),
                Fluttertoast.showToast(
                  msg: 'Login Successful',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.green,
                  timeInSecForIosWeb: 1,
                  fontSize: 16,
                ),
              })
          .catchError((e) {
        Fluttertoast.showToast(
          msg: e!.message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          timeInSecForIosWeb: 1,
          fontSize: 16,
        );
      });
    }
  }
}
