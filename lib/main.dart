import 'package:flutter/material.dart';

import 'Logins.dart';

void main()
{
  runApp(MaterialApp
    (
    //theme: ThemeData.dark(),
    initialRoute: '/logIn',
    routes:
    {
      '/logIn': (context)=> const LogIn(),
    },
  ));
}
