import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynewapp/Game/elementBuilder.dart';

import 'package:mynewapp/Screens/Home/stars.dart';
import 'package:mynewapp/Services/authentication_service.dart';
import 'package:mynewapp/Strings/images.dart';
import 'package:mynewapp/Utils/textStyles.dart';

class BuildDrawer extends StatefulWidget {
  @override
  _BuildDrawerState createState() => _BuildDrawerState();
}

class _BuildDrawerState extends State<BuildDrawer> {
  Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(
            icon: Icons.contacts,
            text: 'Profile',
            onPressed: () {},
          ),
          Divider(),
          _createDrawerItem(
            icon: Icons.bug_report,
            text: 'Report an issue',
            onPressed: () {},
          ),
          _createDrawerItem(
              icon: Icons.exit_to_app,
              text: 'Logout',
              onPressed: () => context.read<AuthenticationService>().signOut()),
          // ListTile(
          //   title: Text('v0.0.1'),
          //   onTap: () {},
          // ),
        ],
      ),
    );
  }

  Widget _createHeader() {
    var user = FirebaseAuth.instance.currentUser;
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .snapshots(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return Text('');
          } else if (snapshot.hasData) {
            return UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/background-login.jpg'))),
              accountName: Text(
                  '${snapshot.data['firstName']} ${snapshot.data['lastName']}'),
              accountEmail: Text('${snapshot.data['email']}'),
            );
          }
          return Center();
        });
  }

  Widget _createDrawerItem({IconData icon, String text, onPressed}) {
    return ListTile(
        title: MaterialButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Row(
        children: [
          Icon(icon),
          Text(text),
        ],
      ),
    ));
  }
}
