
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:scholar_hub/Contents/navigationDrawer.dart';




class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState()
  {
    super.initState();

  }
  int _selectedIndex = 0;

  static  final List<Widget> _widgetOptions = <Widget>[
    // pages
    Home(),
    ServicesPage(),
    PastPapersPage(),
    AcademicResearchPage(),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      drawer :const Navigation_drawer(),
      appBar: AppBar(
        title: null,
        backgroundColor: Colors.green,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Welcome,your name',
              style:const  TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green
              ),
            ),
          ),

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
    return  Scaffold
      (
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text("Services Page",style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: Colors.green,
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
    return Scaffold
      (
      backgroundColor: Colors.grey[900],
      appBar: AppBar
        (
        title: Text('Past Papers',style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
    );
  }
}

class AcademicResearchPage extends StatefulWidget {
  const AcademicResearchPage({Key? key}) : super(key: key);

  @override
  State<AcademicResearchPage> createState() => _AcademicResearchPageState();
}

class _AcademicResearchPageState extends State<AcademicResearchPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Academic Research',style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),

    );
  }
}


/*openMail(){
  return launchUrl(
      Uri.parse(
          'mailto:mwichabecollins@gmail.com?subject=Hello&body=Iam using Kibabii Library App and I would like to enquire about...)'
      )
  );
}
*/
/*whatsApp() {
  return launchUrl(
    Uri.parse(
      'whatsapp://send?phone=+254704858069+&text=Hello, Iam using the Kibabbii Library App'
          'application and I would like to enquire about...',
    ),
  );
}*/
//notification page

