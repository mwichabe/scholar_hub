import 'package:flutter/material.dart';
import 'package:scholar_hub/widgets/buttonWidget.dart';
import 'package:scholar_hub/widgets/textField.dart';
import 'package:scholar_hub/widgets/waveWidgets.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController _emailEditingController = new TextEditingController();
  @override
  void dispose() {
    _emailEditingController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return  SafeArea(
      child: Scaffold
        (
        backgroundColor: Colors.green,
        body :  SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              children: [
                Text(
                  'LOG IN', style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                ),
                ),
                Stack(
                  children: [
                    Container
                      (
                      height: size.height-200,
                      color: Colors.green,
                    ),
                    WaveWidgets
                      (
                      size: size,
                      yOffset: size.height / 3.0,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column
                        (
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:
                        [
                          TextFieldWidget(
                           hintText: 'Email',
                            obscureText: false,
                            prefixIconData: Icons.mail_lock_outlined,
                          ),
                          SizedBox(height: 10,),
                          TextFieldWidget(
                            hintText: 'Password',
                            obscureText: false,
                            prefixIconData: Icons.lock,

                          ),
                          SizedBox(height: 20,),
                          ButtonWidget
                            (
                            title: 'Login',
                            hasBoader: false,
                          ),
                          SizedBox(height: 10,),
                          ButtonWidget
                            (
                            title: 'Sign Up',
                            hasBoader: true,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}
