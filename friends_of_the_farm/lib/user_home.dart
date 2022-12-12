// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:friends_of_the_farm/admin.dart';
import 'package:friends_of_the_farm/profile_page.dart';
import 'package:friends_of_the_farm/main.dart';
import 'package:google_fonts/google_fonts.dart';

FirebaseFirestore database = FirebaseFirestore.instance;

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = <Widget>[
    const UserHomePage(),
    const AdminScreen(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Friends of the Farm'),
      ),
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_task),
            label: 'Admin',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        //When an item gets selected we go into a function where we save the index and use that to create the tasks
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHomePage> {
  String hours = "N/A";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHours();
  }

  final myController =
      TextEditingController(); //controller to accept input from textfield

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  Future<void> update(new_hours) async {
    final current_user =
        FirebaseAuth.instance.currentUser?.uid; // get the current user id

    final docRef = database
        .collection("users")
        .doc(current_user); //get the current users document

    var new_parse =
        int.parse(new_hours); // these are string values so we convert to int
    var old_parse = int.parse(hours);
    String parsed_value = (new_parse + old_parse)
        .toString(); // after adding convert back to string

    await docRef.update({
      //update at user's doc the hours field with new value
      "hours": parsed_value,
    });
    getHours();
  }

  void getHours() {
    if (FirebaseAuth.instance.currentUser != null) {
      print(FirebaseAuth.instance.currentUser?.uid); // this is the user id
      final current_user = FirebaseAuth.instance.currentUser?.uid;
      print(current_user);
      // this reference asks the database for the collection in the ""
      final docRef = database.collection("users").doc(
          current_user); //the users collection needs to have ids that are usernames
      docRef.get().then(
        (DocumentSnapshot doc) {
          final data = doc.data()
              as Map<String, dynamic>; //get the data that's in the collection
          hours = data[
              'hours']; //get the field that's labelled hours within the collection
        },
        onError: (e) => print("Error getting document: $e"),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      const Text('Your Next Tasks:'),
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            ListTile(
              leading: Icon(Icons.apple),
              title: Text('Water Garden Plots XYZ'),
              subtitle: Text('Today'),
            ),
            ListTile(
              leading: Icon(Icons.catching_pokemon),
              title: Text('Feed the Chickens'),
              subtitle: Text('This Morning'),
            ),
          ],
        ),
      ),
      ElevatedButton(
        key: const Key("HoursWorked"),
        style: ElevatedButton.styleFrom(
            textStyle: GoogleFonts.lobster(fontSize: 20),
            primary: Colors.blueGrey),
        child: Text('View Hours Worked'),
        onPressed: () {
          showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                    title: const Text(
                        'Hours Worked'), // To display the title it is optional
                    content: Text(hours),

                    actions: [
                      Row(
                        children: [
                          //this row contains a text field and button for user to submit hours
                          SizedBox(
                            width: 120,
                            height: 40,
                            child: TextField(
                              controller: myController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Hours Worked',
                              ),
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                update(myController
                                    .text); //calls update database to store new values in firestore
                              },
                              child: Text("Input New Hours"))
                        ],
                      )
                    ],
                  ));
        },
      ),
    ]);
  }
}
