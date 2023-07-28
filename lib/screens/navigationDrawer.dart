import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../models/users.dart';

class Navigation_drawer extends StatefulWidget {
  const Navigation_drawer({Key? key}) : super(key: key);

  @override
  State<Navigation_drawer> createState() => _Navigation_drawerState();
}

class _Navigation_drawerState extends State<Navigation_drawer> {
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

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          InkWell(
            onTap: () => Navigator.pushReplacementNamed(context, 'profile'),
            child: UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.green,
              ),
              accountName: Text('${loggedInUser.userName}'),
              accountEmail: Text('${loggedInUser.email}'),
              currentAccountPicture: CircleAvatar(
                radius: 64,
                backgroundColor: Colors.white,
                child: ClipOval(
                  child: SizedBox(
                      height: 180,
                      width: 180,
                      child: CachedNetworkImage(
                        imageUrl: loggedInUser.profilePictureUrl ??
                            'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.shutterstock.com%2Fsearch%2Fno-pic&psig=AOvVaw1vimfDmYP_L5_RO8q5c-b4&ust=1687025663941000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCPD0zMCyyP8CFQAAAAAdAAAAABAJ',
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(
                          backgroundColor: Colors.black,
                          color: Colors.green,
                        ),
                        errorWidget: (context, url, error) => Icon(
                          Icons.error,
                          color: Colors.red,
                        ),
                      )),
                ),
              ),
            ),
          ),
          ListTile(
              leading: const Icon(
                Icons.admin_panel_settings_outlined,
                color: Colors.green,
              ),
              title: const Text(
                'Admin',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () =>
                  Navigator.pushReplacementNamed(context, 'adminLogIn')),
          ListTile(
              leading: const Icon(Icons.book_online, color: Colors.green),
              title: const Text(
                'Past papers',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () =>
                  Fluttertoast.showToast(msg: 'will be implemented soon')),
          ListTile(
            leading: const Icon(Icons.explore, color: Colors.green),
            title: const Text(
              'Academic Research',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () =>
                Fluttertoast.showToast(msg: 'will be implemented soon'),
          ),
          ListTile(
              leading: const Icon(Icons.design_services_outlined,
                  color: Colors.green),
              title: const Text(
                'Services',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () =>
                  Fluttertoast.showToast(msg: 'will be implemented soon')),
          ListTile(
              leading: const Icon(Icons.help, color: Colors.green),
              title: const Text(
                'Help',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () =>
                  Fluttertoast.showToast(msg: 'will be implemented soon')),
          ListTile(
              leading: const Icon(Icons.settings, color: Colors.red),
              title: const Text(
                'Delete Account',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () =>
                  Fluttertoast.showToast(msg: 'will be implemented soon')),
          ListTile(
              leading: const Icon(Icons.logout, color: Colors.white),
              title:
                  const Text('Log out', style: TextStyle(color: Colors.white)),
              onTap: () => showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Confirm Logging Out'),
                        content:
                            const Text('Are you sure you want to proceed?'),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              'No',
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () async {
                              // Sign out from FirebaseAuth
                              await FirebaseAuth.instance.signOut().then(
                                  (value) => Navigator.pushReplacementNamed(
                                      context, '/logIn'));

                              // Remove email from SharedPreferences

                              // Navigate to the login screen
                            },
                            child: const Text(
                              'Yes',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ))
        ],
      ),
    );
  }
}
