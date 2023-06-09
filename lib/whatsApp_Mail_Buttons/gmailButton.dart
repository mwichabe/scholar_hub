import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class GmailButton extends StatelessWidget {
  const GmailButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
        openMail();
      },
      child: Image.asset(
        'images/appLogos/gmail.jpg',
        height: 60,
      ),
    );
  }
}


openMail(){
  return launchUrl(
      Uri.parse(
          'mailto:mwichabecollins@gmail.com?subject=Hello&body=Iam using Smart Desk and I would like to participate in the following service(s)'
      )
  );

}

