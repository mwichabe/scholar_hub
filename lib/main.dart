import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scholar_hub/provider/Auth.dart';
import 'package:scholar_hub/screens/admin/adminLogIn.dart';
import 'package:scholar_hub/screens/admin/adminMba.dart';
import 'package:scholar_hub/screens/admin/adminnHomePage.dart';
import 'package:scholar_hub/screens/homePage.dart';
import 'package:scholar_hub/screens/initial_profile.dart';
import 'package:scholar_hub/screens/past%20Papers/MBA.dart';
import 'package:scholar_hub/screens/profilePage.dart';
import 'package:scholar_hub/screens/termsAndCondition.dart';
import 'screens/Logins.dart';
import 'screens/SignUpPage.dart';

Future<void> main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp
    (
    //theme: ThemeData.dark(),
    initialRoute: 'auth',
    debugShowCheckedModeBanner: false,
    routes:
    {
      'auth': (context)=> const AuthPage(),
      '/logIn': (context)=> const LogIn(),
      '/signUp': (_)=> const SignUpPage(),
      'adminLogIn': (context)=> const AdminLogIn(),
      'home': (context)=>  HomePage(),
      'profile': (context)=> const ProfilePage(),
      'mba': (_)=> const MBA(),
      'termsAndCondition': (_)=> const TermsAndCondition(),
      'adminHomePage': (_)=> const AdminHomePage(),
      'adminMba': (_)=> const AdminMba(),
      'initialProfile': (_)=> const InitialProfile(),

    },
  ));
}
