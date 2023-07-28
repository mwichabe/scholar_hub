import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scholar_hub/constants/Global.dart';
import 'package:scholar_hub/models/users.dart';
import 'package:scholar_hub/screens/Posts/post_video.dart';
import 'package:scholar_hub/screens/Posts/writePost.dart';
import 'package:url_launcher/url_launcher.dart';

import 'PromoteBusinessPage.dart';
import 'navigationDrawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  @override
  void initState() {
    super.initState();
  }

  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    // pages
    Home(),
    const BusinessPromotion(),
    const PastPapersPage(),
    const AcademicResearchPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[900],
          body: IndexedStack(
            index: _selectedIndex,
            children: _widgetOptions,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            backgroundColor: Colors.green,
            selectedItemColor: Colors.black,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'Services',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.article),
                label: 'Past Papers',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'Academic Research',
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

// Home page
class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  List<String> advertisements = [
    'images/Serviceindex.jpeg',
    'images/pastPapers.jpeg',
    'images/Research-Spotlight-Highlights_blog.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      drawer: const Navigation_drawer(),
      appBar: AppBar(
        backgroundColor: Global.primaryColor,
        title: const Text('Home',style: TextStyle(color: Colors.black),),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            color: Colors.black,
            icon: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Global.secondaryColor,
              ),

              child: const Icon(
                Icons.add,
                color: Global.primaryColor,
              ),
            ),
            onSelected: (String value) {
              switch (value) {
                case 'Write Thought':
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WritePost()));
                  break;
                case 'Post Video':
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PostVideo()));
                  break;
                case 'About':
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('About'),
                        content: SingleChildScrollView(
                            child: Container(
                              padding: const EdgeInsets.all(
                                  16.0), // Add padding for spacing
                              child: const SingleChildScrollView(
                                child: Text(
                                  'About this Appp',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 16.0, // Adjust the font size
                                    color: Colors.black, // Set the text color
                                    height: 1.5, // Adjust the line height
                                  ),
                                ),
                              ),
                            )),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Close',
                                style: TextStyle(color: Colors.black)),
                          ),
                        ],
                      );
                    },
                  );
                  break;
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Write Thought',
                child: Text(
                  'Write Thought',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const PopupMenuItem<String>(
                  value: 'Post Video',
                  child: Text('Post Video',
                      style: TextStyle(color: Colors.white))),
              const PopupMenuItem<String>(
                  value: 'About',
                  child: Text('About',
                      style: TextStyle(color: Colors.white))),
            ],
          )
        ],
      ),
    );
  }
}

//services tab
class BusinessPromotion extends StatefulWidget {
  const BusinessPromotion({Key? key}) : super(key: key);

  @override
  State<BusinessPromotion> createState() => _BusinessPromotionState();
}

class _BusinessPromotionState extends State<BusinessPromotion> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  List<String> advertisements = [
    'images/Serviceindex.jpeg',
    'images/pastPapers.jpeg',
    'images/Research-Spotlight-Highlights_blog.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text(
          'BUSINESS',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.green,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome, ${loggedInUser.userName}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade100,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    'Promote your business here.>>',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.green.shade100,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PromoteBusiness()));
                    },
                    child: const Text(
                      'CLick Here.',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: advertisements.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 300,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          advertisements[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'REACH OUT TO US:',
                style: TextStyle(color: Colors.green.shade100),
              ),
              const SizedBox(height: 10),
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
}

//past papers tab
class PastPapersPage extends StatefulWidget {
  const PastPapersPage({Key? key}) : super(key: key);

  @override
  State<PastPapersPage> createState() => _PastPapersPageState();
}

class _PastPapersPageState extends State<PastPapersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title:
              const Text('Past Papers', style: TextStyle(color: Colors.black)),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              margin: const EdgeInsets.all(18),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.green,
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      buildCourseCard(
                        'MBA (Master of Business Administration)',
                        Colors.green,
                        () {
                          Navigator.pushNamed(context, 'mba');
                        },
                      ),
                      const SizedBox(height: 20),
                      buildCourseCard(
                        'MSc (Master of Science)',
                        Colors.green,
                        () {
                          Navigator.pushNamed(context, 'msc');
                        },
                      ),
                      const SizedBox(height: 20),
                      buildCourseCard(
                        'MPPA (Master in Public Policy and Administration)',
                        Colors.green,
                        () {
                          Navigator.pushReplacementNamed(context, 'mppa');
                        },
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  Widget buildCourseCard(String title, Color color, VoidCallback onPressed) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.school,
                size: 40,
                color: Colors.black,
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//academic research
class AcademicResearchPage extends StatefulWidget {
  const AcademicResearchPage({Key? key}) : super(key: key);

  @override
  State<AcademicResearchPage> createState() => _AcademicResearchPageState();
}

class _AcademicResearchPageState extends State<AcademicResearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text(
          'Academic Research',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'At an affordable fee, you can get:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const BulletPoint(text: 'Business proposals'),
              const BulletPoint(text: 'Diploma proposals'),
              const BulletPoint(text: 'Bachelors proposals'),
              const BulletPoint(text: 'Masters proposals'),
              const BulletPoint(text: 'PhD proposals'),
              const BulletPoint(text: 'Analysis using SPSS/STATA'),
              const BulletPoint(text: 'Power point presentations'),
              const BulletPoint(text: 'Plagiarism edits'),
              const BulletPoint(
                  text: 'Concept papers, journal development, and assignments'),
              const BulletPoint(text: 'Thesis'),
              const BulletPoint(text: 'Dissertations'),
              const BulletPoint(text: 'Defence preparations'),
              const BulletPoint(
                  text: 'Company profiles and any other research needs'),
              const SizedBox(height: 20),
              const Text(
                'Email us or WhatsApp or call the number attached to get professional assistance.',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                  IconButton(
                    onPressed: () => launchUrl(Uri.parse('tel:+254704858069')),
                    icon: const Icon(
                      Icons.phone,
                      size: 60,
                      color: Colors.green,
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
}

openMail() {
  return launchUrl(Uri.parse(
      'mailto:mwichabecollins@gmail.com?subject=Hello&body=Iam using Kibabii Library App and I would like to enquire about...)'));
}

whatsApp() {
  return launchUrl(
    Uri.parse(
      'whatsapp://send?phone=+254704858069+&text=Hello, Iam using the Kibabbii Library App'
      'application and I would like to enquire about...',
    ),
  );
}

class BulletPoint extends StatelessWidget {
  final String text;

  const BulletPoint({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: 10,
            height: 10,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
