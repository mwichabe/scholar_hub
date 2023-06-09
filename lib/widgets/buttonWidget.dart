import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final bool hasBoader;
  ButtonWidget({
   required this.title,
   required this.hasBoader,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        decoration: BoxDecoration
          (
          color: hasBoader ? Colors.green : Colors.black,
          borderRadius: BorderRadius.circular(10),
          border: hasBoader ? Border.all(color: Colors.black,
          width: 1)
              : Border.fromBorderSide(BorderSide.none),
        ),
        child: InkWell(
          onTap: ()
          {
            hasBoader ? {Navigator.pushReplacementNamed(context, '/signUp')}
                :
                Navigator.pushReplacementNamed(context, 'home');
          } ,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 30,
            child: Center(
              child: Text
                (
                title,
                style: TextStyle
                  (
                  color: hasBoader ? Colors.black : Colors.green,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ) ,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
