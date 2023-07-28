import 'package:flutter/material.dart';
class TermsAndCondition extends StatefulWidget {
  const TermsAndCondition({Key? key}) : super(key: key);

  @override
  State<TermsAndCondition> createState() => _TermsAndConditionState();
}

class _TermsAndConditionState extends State<TermsAndCondition> {
  bool isAccepted = false;
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green,
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Card(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text(
                              'These are the Terms and Conditions for this app:',
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                            SizedBox(height: 16.0),
                            Text(
                              '1. User Content:',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '1.1. Users can post their thoughts, comments, and share images on the application.',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Text(
                              '1.2. Users are solely responsible for the content they post, and any consequences resulting from their actions.',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Text(
                              '1.3. You must not post any content that is illegal, abusive, defamatory, offensive, or infringes upon the rights of others.',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Text(
                              '1.4. We reserve the right to remove or moderate any content that violates these terms.',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            SizedBox(height: 16.0),
                            Text(
                              '2. Intellectual Property:',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '2.1. By posting content on the application, you grant us a non-exclusive, worldwide, royalty-free license to use, modify, reproduce, distribute, and display your content.',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Text(
                              '2.2. You affirm that you have the necessary rights or permissions to grant us the license mentioned in clause 2.1.',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            SizedBox(height: 16.0),
                            Text(
                              '3. Privacy:',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '3.1. Personal Information. When you register an account or use certain features of the application, we may collect personal information such as your name, email address, and profile picture.',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Text(
                              '3.2. We may use your information to personalize your experience and provide content that is relevant to you.',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Text(
                              'Communication. We may use your email address to send you important updates, announcements, and promotional materials',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: isAccepted,
                        onChanged: (value) {
                          setState(() {
                            isAccepted = value ?? false;
                          });
                        },
                      ),
                      const Text('I accept the terms and conditions'),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: isAccepted ? () => Navigator.pushReplacementNamed(context, '/signUp') : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    child:  const Text('Next'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
