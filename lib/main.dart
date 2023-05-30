import 'package:flutter/material.dart';
import 'package:scholar_hub/Contents/admin/adminLogIn.dart';
import 'package:scholar_hub/Contents/homePage.dart';

import 'Logins.dart';

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
      'adminLogIn': (context)=> const AdminLogIn(),
      'home': (context)=>  HomePage(),
    },
  ));
}
