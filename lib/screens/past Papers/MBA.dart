import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MBA extends StatefulWidget {
  const MBA({Key? key}) : super(key: key);

  @override
  State<MBA> createState() => _MBAState();
}

class _MBAState extends State<MBA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              'Master in Business Administration',
              style:
                  TextStyle(fontWeight: FontWeight.w800, color: Colors.black),
            )),
        centerTitle: true,
        elevation: 1.0,
        backgroundColor: Colors.green,
      ),
      body:  StreamBuilder<QuerySnapshot>(
          stream:
          FirebaseFirestore.instance.collection('mbaPastPapers').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator(
                color: Colors.indigo,
                backgroundColor: Colors.black,
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(child: Text('No mba past paper found.'));
            } else {
              final mbaPastPaperDoc = snapshot.data!.docs;
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: SingleChildScrollView(
                      child: SizedBox(
                        height: 800,
                        child: ListView.builder(
                            itemCount: mbaPastPaperDoc.length,
                            itemBuilder: (context, index) {
                              final mba = mbaPastPaperDoc[index];
                              final imageUrl = mba['imageUrl'];
                              final pastPaperName = mba['paperName'];
                              final unitCode = mba['unitCode'];


                              return Card(
                                color: Colors.white,
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Container(
                                decoration: BoxDecoration(
                                gradient:  LinearGradient(
                                colors: [Colors.green, Colors.green.shade100],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,),
                                borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text('$unitCode :',style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                          const SizedBox(width: 10,),
                                          Text(pastPaperName, style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                      const Divider(height: 5,),
                                      ClipRRect(
                                          borderRadius: BorderRadius.circular(8),
                                        child:Image.network(imageUrl,
                                          fit: BoxFit.cover,
                                        )
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30,)
                ],
              );
            }
          }
      )
    );
  }
}
