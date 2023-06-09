import 'package:flutter/material.dart';
import 'package:scholar_hub/widgets/buttonWidget.dart';
import 'package:scholar_hub/widgets/textField.dart';
import 'package:scholar_hub/widgets/waveWidgets.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green,
       body:  SingleChildScrollView(
         child: Padding(
           padding:  EdgeInsets.fromLTRB(10.0,30.0,10.0,10.0),
           child: Column(
             children: [
               Text('REGISTER', style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),
               SizedBox(height: 20,),
               Padding(
                 padding: const EdgeInsets.all(18.0),
                 child: Form(
                     child: Column(
                       children: [
                         TextFormField(
                           cursorColor: Colors.black,
                           autofillHints: const <String>['@gmil.com','mwichabecollins@gmail.com'],
                           style: const TextStyle(color: Colors.black),
                           decoration: InputDecoration(
                             enabledBorder: UnderlineInputBorder(
                               borderRadius: BorderRadius.circular(10),
                               borderSide: BorderSide(color: Colors.green.shade100)
                             ),
                             focusedBorder: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(10),
                                 borderSide: BorderSide(color: Colors.green.shade100)
                             ),
                             hintText: 'Gmail',
                             prefixIcon: Icon(Icons.email,color: Colors.black,)

                           ),
                         ),
                         const SizedBox(height: 16,),
                         TextFormField(
                           cursorColor: Colors.black,
                           style: const TextStyle(color: Colors.black),
                           decoration: InputDecoration(
                               enabledBorder: UnderlineInputBorder(
                                   borderRadius: BorderRadius.circular(10),
                                   borderSide: BorderSide(color: Colors.green.shade100)
                               ),
                               focusedBorder: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(10),
                                   borderSide: BorderSide(color: Colors.green.shade100)
                               ),
                               hintText: 'Username',
                               prefixIcon: Icon(Icons.person,color: Colors.black,)

                           ),
                         ),
                         const SizedBox(height: 16,),
                         TextFormField(
                           obscureText: true,
                           cursorColor: Colors.black,
                           style: const TextStyle(color: Colors.black),
                           decoration: InputDecoration(
                               enabledBorder: UnderlineInputBorder(
                                   borderRadius: BorderRadius.circular(10),
                                   borderSide: BorderSide(color: Colors.green.shade100)
                               ),
                               focusedBorder: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(10),
                                   borderSide: BorderSide(color: Colors.green.shade100)
                               ),
                               hintText: 'Password',
                               prefixIcon: Icon(Icons.lock,color: Colors.black,)

                           ),
                         ),
                         const SizedBox(height: 16,),
                         TextFormField(
                           obscureText: true,
                           cursorColor: Colors.black,
                           style: const TextStyle(color: Colors.black),
                           decoration: InputDecoration(
                               enabledBorder: UnderlineInputBorder(
                                   borderRadius: BorderRadius.circular(10),
                                   borderSide: BorderSide(color: Colors.green.shade100)
                               ),
                               focusedBorder: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(10),
                                   borderSide: BorderSide(color: Colors.green.shade100)
                               ),
                               hintText: 'Confirm password',
                               prefixIcon: Icon(Icons.lock,color: Colors.black,)

                           ),
                         ),
                         const SizedBox(height: 16,)
                       ],
                     ),
                 ),
               ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),

                    ),
                    child: ElevatedButton(onPressed: (){
                      Navigator.pushReplacementNamed(context, 'home');
                    },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black
                        ),
                        child: Text('REGISTER',style: TextStyle(color: Colors.green),)
                    ),
                  ),
                  const SizedBox(height: 5,),
                  ElevatedButton(onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green
                      ),
                      child: Text('LOG IN',style: TextStyle(color: Colors.black),)
                  )
                ],
              )
             ],
           ),
         ),
       ),
      ),
    );
  }
}
