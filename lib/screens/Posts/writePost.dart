import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scholar_hub/constants/Global.dart';
import 'package:scholar_hub/screens/homePage.dart';

class WritePost extends StatefulWidget {
  const WritePost({Key? key}) : super(key: key);

  @override
  State<WritePost> createState() => _WritePostState();
}

class _WritePostState extends State<WritePost> {
  final TextEditingController _postController = TextEditingController();
  void _onDoneButtonPressed() {
    String postText = _postController.text;
    if (postText.isNotEmpty) {
      _showPostTextAlertDialog(postText);
    } else {
      Fluttertoast.showToast(msg: 'You have not written any post');

    }

    // Unfocus the TextField after pressing the "Done" button.
    FocusScope.of(context).unfocus();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Global.primaryColor,
        title: const Text('Write Post',style: TextStyle(color: Colors.black),),
      actions: [
        IconButton(
            onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
            },
            icon: const Icon(Icons.close,color: Colors.black,)
        )
      ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[800]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: TextField(
                  controller: _postController,
                  maxLines: null, // Allows the TextField to grow as users type.
                  style: const TextStyle(color: Colors.white),
                  decoration:  InputDecoration(
                    hintText: 'Share your thoughts...',
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                      ),
                    ),
                    suffix: IconButton(onPressed: (){
                      _postController.clear();
                    },
                        icon: const Icon(CupertinoIcons.clear_circled_solid,color: Colors.black,)
                    )
                  ),
                  cursorColor: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _onDoneButtonPressed,
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.black
                ),
                child: const Text('Done'),
              ),
              ElevatedButton(
                onPressed: () {
                  // TODO: Implement the logic to post the thought to the backend.
                  String postText = _postController.text;
                  if (postText.isNotEmpty) {
                    // You can now process and save the 'postText' to your backend or database.
                    // For example, you can use Firebase Firestore or Realtime Database to store the posts.
                    // After posting, you might want to navigate back to the home page or show a success message.
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.black
                ),
                child: const Text('Post'),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _showPostTextAlertDialog(String postText) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Review Post'),
          content: SingleChildScrollView(child: Text(postText)),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Close the alert dialog.
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.black,
              ),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
  @override
  void dispose() {
    _postController.dispose();
    super.dispose();
  }
}
