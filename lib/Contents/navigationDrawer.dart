
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class Navigation_drawer extends StatefulWidget {
  const Navigation_drawer({Key? key}) : super(key: key);

  @override
  State<Navigation_drawer> createState() => _Navigation_drawerState();
}

class _Navigation_drawerState extends State<Navigation_drawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
              decoration: const BoxDecoration
                (
                color: Colors.green,
              ),
              accountName:  Text('first name secnd name'),
              accountEmail: Text('your email'),
              currentAccountPicture:
               CircleAvatar(
                backgroundColor: Colors.white,
                radius: 70,
                child:  Image.network('https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.flaticon.com%2Ffree-icon%2Fperson_2815428&psig=AOvVaw3AEZS1m0zpCDc9kDAvuDbj&ust=1685547584222000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCMiO1Zuwnf8CFQAAAAAdAAAAABAO'),
              )
          ),
          ListTile(
            leading: Icon(Icons.admin_panel_settings_outlined,color: Colors.green,),
            title:   const Text('Admin',style: TextStyle(color: Colors.white),),
            onTap: ()=> Navigator.pushReplacementNamed(context, 'adminLogIn')
          ),
          ListTile(
            leading:  Icon(Icons.book_online,color: Colors.green),
            title:  const Text('Past papers',style: TextStyle(color: Colors.white),),
            onTap: ()=>Fluttertoast.showToast(msg: 'will be implemented soon')
          ),
          ListTile(
            leading:  Icon(Icons.explore,color: Colors.green),
            title:  const Text('Academic Research',style: TextStyle(color: Colors.white),),
            onTap: ()=>Fluttertoast.showToast(msg: 'will be implemented soon'),
          ),
          ListTile(
            leading:  Icon(Icons.design_services_outlined,color: Colors.green),
            title:  const Text('Services',style: TextStyle(color: Colors.white),),
            onTap: ()=>Fluttertoast.showToast(msg: 'will be implemented soon')
          ),
          ListTile(
            leading:  Icon(Icons.help,color: Colors.green),
            title:  const Text('Help',style: TextStyle(color: Colors.white),),
            onTap: ()=>Fluttertoast.showToast(msg: 'will be implemented soon')
          ),
          ListTile(
            leading:  Icon(Icons.settings,color: Colors.red),
            title:  const Text('Delete Account',style: TextStyle(color: Colors.white),),
            onTap: ()=> Fluttertoast.showToast(msg: 'will be implemented soon')
          ),
          ListTile(
              leading:  Icon(Icons.exit_to_app,color: Colors.red),
              title:  const Text('Log out',style: TextStyle(color: Colors.white),),
              onTap: (){
                Fluttertoast.showToast(msg: 'will be implemented soon');
                //FirebaseAuth.instance.signOut().then((value)
                
              }
          ),
        ],
      ),
    );
  }
}