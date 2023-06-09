import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:scholar_hub/Contents/navigationDrawer.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    // pages
    Home(),
    const ServicesPage(),
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
  /*User? user = FirebaseAuth.instance.currentUser;

  UserModelOne loggedInUser = UserModelOne();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((value){
      loggedInUser= UserModelOne.fromMap(value.data());
      setState((){});
    });
  }
*/
  List<String> advertisements = [
    'images/Serviceindex.jpeg',
    'images/pastPapers.jpeg',
    'images/Research-Spotlight-Highlights_blog.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      drawer: const Navigation_drawer(),
      appBar: AppBar(
        title: null,
        backgroundColor: Colors.green,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  'Welcome, your name.\n',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade100,
                  ),
                ),
                Text(
                  'We offer the best services for you scholar.',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.green.shade100,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 200, // Adjust the height as per your needs
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: advertisements.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 300, // Adjust the width as per your needs
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Center(
                          child: Image.asset(
                            advertisements[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              'REACH OUT TO US:',
              style: TextStyle(color: Colors.green.shade100),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    'images/appLogos/whatsApp.png',
                    height: 60,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    'images/appLogos/gmail.jpg',
                    height: 70,
                  ),
                ),
                const SizedBox(
                  width: 5,
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
          )
        ],
      ),
    );
  }
}

//services tab
class ServicesPage extends StatefulWidget {
  const ServicesPage({Key? key}) : super(key: key);

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text(
          'Services Page',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 20.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Services',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const ServiceTile(
                  title: 'Virtual tutorials',
                  description: 'Learn online from anywhere',
                  icon: Icons.laptop,
                ),
                const SizedBox(height: 10),
                const ServiceTile(
                  title: 'Physical tutorials',
                  description: 'Available for Nairobi residents',
                  icon: Icons.location_on,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Subjects',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const ServiceTile(
                  title: 'Managerial economics',
                  icon: Icons.check_circle,
                ),
                const SizedBox(height: 10),
                const ServiceTile(
                  title: 'Micro-economics',
                  icon: Icons.check_circle,
                ),
                const SizedBox(height: 10),
                const ServiceTile(
                  title: 'Macro-economics',
                  icon: Icons.check_circle,
                ),
                const SizedBox(height: 10),
                const ServiceTile(
                  title: 'Quantitative Analysis',
                  icon: Icons.check_circle,
                ),
                const SizedBox(height: 10),
                const ServiceTile(
                  title: 'Applied Statistics',
                  icon: Icons.check_circle,
                ),
                const SizedBox(height: 10),
                const ServiceTile(
                  title: 'Theory of Finance',
                  icon: Icons.check_circle,
                ),
                const SizedBox(height: 10),
                const ServiceTile(
                  title: 'Taxation',
                  icon: Icons.check_circle,
                ),
                const SizedBox(height: 10),
                const ServiceTile(
                  title: 'Financial Accounting',
                  icon: Icons.check_circle,
                ),
                const SizedBox(height: 10),
                const ServiceTile(
                  title: 'Cost Accounting',
                  icon: Icons.check_circle,
                ),
                const SizedBox(height: 10),
                const ServiceTile(
                  title: 'Management Accounting',
                  icon: Icons.check_circle,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Why Us?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: Colors.grey.shade100,
                  ),
                  //color: Colors.grey,
                  child: const Text(
                    'WHY US?\n\n\n'
                    'Hello, by engaging with us you will be able to '
                    'gain the following benefits:\n\n'
                    '1. You will get free learning materials.\n'
                    '2. Affordable, flexible and subject variety.\n'
                    '3. Service delivery that operates for 24hours.\n'
                    '4. Expert tutorials.\n'
                    '5. Quality services at flexible and affordable charges',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                const Text(
                  'Reach out to us for scheduling.',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  //crossAxisAlignment: CrossAxisAlignment.end,
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
                        height: 70,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        launchUrl(Uri.parse('tel:+254704858069'));
                      },
                      icon: const Icon(
                        Icons.phone,
                        size: 60,
                      ),
                      color: Colors.green,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  whatsApp() {
    return launchUrl(
      Uri.parse(
        'whatsapp://send?phone=+254704858069+&text=Hello, Iam using Smart Desk and I would like to participate in the following service(s)',
      ),
    );
  }

  openMail() {
    return launchUrl(Uri.parse(
        'mailto:mwichabecollins@gmail.com?subject=Hello&body=Iam using Smart Desk and I would like to participate in the following service(s)'));
  }
}

class ServiceTile extends StatelessWidget {
  final String title;
  final String? description;
  final IconData icon;

  const ServiceTile({
    required this.title,
    this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[800],
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.white,
          size: 30,
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: description != null
            ? Text(
                description!,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              )
            : null,
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
        title: const Text('Past Papers', style: TextStyle(color: Colors.black)),
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
      )
    );
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
