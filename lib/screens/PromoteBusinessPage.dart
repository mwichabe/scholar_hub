import 'package:flutter/material.dart';
import 'package:scholar_hub/constants/Global.dart';
import 'package:url_launcher/url_launcher.dart';
class PromoteBusiness extends StatelessWidget {
  const PromoteBusiness({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome Entrepreneur'),
        centerTitle: true,
        backgroundColor: Global.primaryColor,
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text('Here are the Terms and Conditions for Business Promotion:'),
              const SizedBox(height: 16),
              const Text(
                '1. Business Promotion:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const Text(
                '1.1. The user will be provided with an opportunity to promote their business through our platform.',
                style: TextStyle(fontSize: 16),
              ),
              const Text(
                '1.2. The user agrees to provide accurate and up-to-date information about their business for promotional purposes.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Text(
                '2. Developer Contact:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const Text(
                '2.1. Click on the buttons at the bottom of this page to reach the developer. The developer may contact the user to discuss and strategize the marketing of the product.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Text(
                '3. Advertisement Cost:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const Text(
                '3.1. The cost of advertising the business on our platform is \$10.55.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Text(
                '4. Payment:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const Text(
                '4.1. The user agrees to pay the advertising cost of \$10.55 before the promotion begins.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Text(
                '5. Duration:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const Text(
                '5.1. The promotion will run for the agreed-upon duration, as specified during the payment process.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Text(
                '6. Modifications and Cancellations:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const Text(
                '6.1. The user can request modifications or cancel the promotion before it starts, subject to our approval.',
                style: TextStyle(fontSize: 16),
              ),
              const Text(
                '6.2. Once the promotion starts, modifications or cancellations are not allowed, and no refunds will be provided.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Text(
                '7. Responsibilities:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const Text(
                '7.1. The user is solely responsible for the content and accuracy of the information provided for promotion.',
                style: TextStyle(fontSize: 16),
              ),
              const Text(
                '7.2. The user agrees not to promote any illegal, offensive, or harmful products or services.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Text(
                '8. Disclaimer:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const Text(
                '8.1. We do not guarantee any specific results or outcomes from the business promotion.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Text(
                '9. Termination:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const Text(
                '9.1. We reserve the right to terminate or suspend the promotion if the user violates the terms and conditions.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      whatsApp();
                    },
                    child: Image.asset(
                      'images/appLogos/whatsApp.png',
                      height: 60,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      openMail();
                    },
                    child: Image.asset(
                      'images/appLogos/gmail.jpg',
                      height: 60,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      launchUrl(Uri.parse('tel:+254704858069'));
                    },
                    child: const Icon(
                      Icons.phone,
                      color: Colors.green,
                      size: 60,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

    );
  }
  openMail() {
    return launchUrl(Uri.parse(
        'mailto:mwichabecollins@gmail.com?subject=Hello&body=Iam using Scholar App and I would like to promote my business...)'));
  }

  whatsApp() {
    return launchUrl(
      Uri.parse(
        'whatsapp://send?phone=+254704858069+&text=Hello, Iam using the Kibabbii Library App'
            'application and I would like to enquire about...',
      ),
    );
  }
}
