import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scholar_hub/screens/Logins.dart';

import '../screens/homePage.dart';
class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold
      (
      body: StreamBuilder<User?>
        (
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot)
        {
          if(snapshot.hasData)
          {
            return  HomePage();
          }
          else {
            return const LogIn();
          }
        },
      ),
    );
  }
}