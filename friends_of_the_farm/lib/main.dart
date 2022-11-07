import 'package:flutter/material.dart';
import 'package:friends_of_the_farm/profile_page.dart';
import 'package:friends_of_the_farm/user_home.dart';
import 'package:friends_of_the_farm/admin.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Friends of the Farm',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        textTheme: GoogleFonts.lobsterTextTheme(),
      ),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

// Define a corresponding State class.
// This class holds data related to the form.
class _LoginScreenState extends State<LoginScreen> {
  // Define the focus node. To manage the lifecycle, create the FocusNode in
  // the initState method, and clean it up in the dispose method.
  late FocusNode myFocusNode;
  final ButtonStyle yesStyle = ElevatedButton.styleFrom(
      textStyle: GoogleFonts.lobster(fontSize: 20), primary: Colors.blueGrey);
  final ButtonStyle noStyle = ElevatedButton.styleFrom(
      textStyle: GoogleFonts.lobster(fontSize: 20), primary: Colors.blueGrey);

  @override
  void initState() {
    super.initState();

    //myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();

    //super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log in'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            // The first text field is focused on as soon as the app starts.
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Username',
              ),
              autofocus: true,
            ),
            // The second text field is focused on when a user taps the
            // FloatingActionButton.
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Password',
              ),
              //focusNode: myFocusNode,
            ),
            Row(
              children: <Widget>[
                ElevatedButton(
                  key: const Key("LoginButton"),
                  style: yesStyle,
                  child: const Text('Log in'),
                  onPressed: () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Navigation()));
                    });
                  },
                ),
                /*ElevatedButton(
                  key: const Key("SignupButton"),
                  style: noStyle,
                  child: const Text('Sign up'),
                  onPressed: () {
                    setState(() {});
                  },
                ),*/
              ],
            ),
          ],
        ),
      ),
    );
  }
}
