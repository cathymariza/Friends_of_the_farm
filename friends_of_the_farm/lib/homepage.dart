/*import 'package:flutter/material.dart';
import 'package:friends_of_the_farm/profile_page.dart';
import 'package:friends_of_the_farm/user_home.dart';
import 'package:friends_of_the_farm/admin.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // new
import 'package:firebase_auth/firebase_auth.dart' // new
    hide
        EmailAuthProvider,
        PhoneAuthProvider; // new
import 'package:firebase_core/firebase_core.dart'; // new
import 'package:firebase_ui_auth/firebase_ui_auth.dart'; // new


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to Friend of the Farm'),
      ),
      body: Column(mainAxisSize: MainAxisSize.min, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer<ApplicationState>(
              builder: (context, appState, _) => AuthFunc(
                  loggedIn: appState.loggedIn,
                  signOut: () {
                    FirebaseAuth.instance.signOut();
                  }),
            ),
          ],
        ),
        Consumer<ApplicationState>(
          builder: (context, appState, _) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (appState.loggedIn) ...[
                Text(
                  'Tasks',
                  style: GoogleFonts.lobster(fontSize: 32),
                ),
              ],
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              ListTile(
                leading: Icon(Icons.apple),
                title: Text('Water Garden Plots XYZ'),
                subtitle: Text('10:30 AM'),
              ),
              ListTile(
                leading: Icon(Icons.catching_pokemon),
                title: Text('Feed the Chickens'),
                subtitle: Text('11:00 AM'),
              ),
            ],
          ),
        ),
        ElevatedButton(
          key: const Key("HoursWorked"),
          style: ElevatedButton.styleFrom(
            textStyle: GoogleFonts.lobster(fontSize: 20),
            backgroundColor: Colors.blueGrey
          ),
          child: const Text('See Hours Worked'),
          onPressed: () {
            showDialog(
              context: context, 
              builder: (context) => const AlertDialog(
                title: Text('Hours Worked'),           // To display the title it is optional
                content: Text('3 hours on 11/04/2022'),
              )
            );
          }
        ),
      ]),
    );
  }
}*/
