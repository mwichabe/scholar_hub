import 'package:flutter/material.dart';
import 'package:scholar_hub/Contents/admin/adminLogIn.dart';
import 'package:scholar_hub/Contents/homePage.dart';
import 'package:scholar_hub/Contents/profilePage.dart';

import 'Logins.dart';
import 'SignUpPage.dart';

void main()
{
  runApp(MaterialApp
    (
    //theme: ThemeData.dark(),
    initialRoute: '/logIn',
    debugShowCheckedModeBanner: false,
    routes:
    {
      '/logIn': (context)=> const LogIn(),
      '/signUp': (_)=> const SignUpPage(),
      'adminLogIn': (context)=> const AdminLogIn(),
      'home': (context)=>  HomePage(),
      'profile': (context)=> const ProfilePage()
    },
  ));
}
