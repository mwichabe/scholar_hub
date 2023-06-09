import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class WhatsAppButton extends StatelessWidget {
  const WhatsAppButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
        whatsApp();
      },
      child: Image.asset(
        'images/appLogos/whatsApp.png',
        height: 60,
      ),
    );
  }
}


  whatsApp() {
    return launchUrl(
      Uri.parse(
        'whatsapp://send?phone=+254704858069+&text=Hello, Iam using Smart Desk and I would like to participate in the following service(s)',
      ),
    );
}

