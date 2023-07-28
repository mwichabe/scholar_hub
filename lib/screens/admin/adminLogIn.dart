import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class AdminLogIn extends StatefulWidget {
  const AdminLogIn({Key? key}) : super(key: key);

  @override
  State<AdminLogIn> createState() => _AdminLogInState();
}

class _AdminLogInState extends State<AdminLogIn> {
  final TextEditingController _adminemailController= TextEditingController();
  final TextEditingController _adminpassController= TextEditingController();
  String adminEmail='admin@gmail.com';
  String adminpass ='1234';

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold
        (
        appBar: AppBar
          (
          elevation: 0.0,
          backgroundColor: Colors.grey[900],
          actions: [
            IconButton(
              icon: const Icon(
                Icons.close,
                color: Colors.green,
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, 'home');
              },
            ),
          ],
        ),
        backgroundColor: Colors.grey[900],
        body: Center
          (
          child: SingleChildScrollView(
            child: Column
              (
              mainAxisAlignment: MainAxisAlignment.center,
              children:
              [
                const Icon(Icons.lock,
                  size: 80,
                color: Colors.green,),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                      child: Column
                        (
                        children:
                        [
                          TextField
                            (
                            decoration: InputDecoration
                              (
                              label: const Text('Enter admin email',style: TextStyle(color: Colors.green)),
                                border: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.green)
                                ),
                              focusedBorder: OutlineInputBorder
                                (
                                borderSide: const BorderSide(color: Colors.green),
                                borderRadius: BorderRadius.circular(10),
                              )
                            ),
                            controller: _adminemailController,
                            cursorColor: Colors.green,
                            style: const TextStyle(color: Colors.green),
                          ),
                          const SizedBox(height: 10,),
                          TextFormField
                            (
                            decoration:  InputDecoration
                              (
                              label: const Text('Enter admin email',style: TextStyle(color: Colors.green)),
                                border: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green)
                                ),
                              focusedBorder:OutlineInputBorder
                                (
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: Colors.green)
                              ),
                            ),
                            controller: _adminpassController,
                            cursorColor: Colors.green,
                            style: const TextStyle(color: Colors.green),
                          )
                        ],
                      )
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom
                    (
                    backgroundColor: Colors.green
                  ),
                    onPressed: ()
                    {
                      if(_adminemailController.text==adminEmail && _adminpassController.text==adminpass)
                      {
                        Navigator.pushReplacementNamed(context, 'adminHomePage');
                      }
                      else
                      {
                        Fluttertoast.showToast(msg: 'You do not have admin privileges');
                      }
                    },
                    child: const Text('Log in As Admin',style: TextStyle(color: Colors.black),)
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}