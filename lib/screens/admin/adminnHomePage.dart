import 'package:flutter/material.dart';
import 'package:scholar_hub/screens/admin/adminBusinessPromotion.dart';
class AdminHomePage extends StatefulWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const AdminBusinessPromotion()));
          },
              icon:const Icon( Icons.navigate_next_rounded)
          )
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
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
                          Navigator.pushReplacementNamed(context, 'adminMba');
                        },
                      ),
                      const SizedBox(height: 20),
                      buildCourseCard(
                        'MSc (Master of Science)',
                        Colors.green,
                            () {
                          Navigator.pushNamed(context, 'adminMsc');
                        },
                      ),
                      const SizedBox(height: 20),
                      buildCourseCard(
                        'MPPA (Master in Public Policy and Administration)',
                        Colors.green,
                            () {
                          Navigator.pushReplacementNamed(context, 'adminMppa');
                        },
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
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
