import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:friends_of_the_farm/pages/profile_page.dart';
import 'package:friends_of_the_farm/pages/home.dart';
import 'package:friends_of_the_farm/pages/admin.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dart:async'; // new

import 'package:cloud_firestore/cloud_firestore.dart'; // new
import 'package:firebase_auth/firebase_auth.dart' // new
    hide
        EmailAuthProvider,
        PhoneAuthProvider; // new
import 'package:firebase_core/firebase_core.dart'; // new
import 'package:firebase_ui_auth/firebase_ui_auth.dart'; // new
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart'; // new

import 'firebase_options.dart'; // new
import 'src/authentication.dart'; // new
import 'src/widgets.dart';

void main() {
  // Modify from here...
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ChangeNotifierProvider(
    create: (context) => ApplicationState(),
    builder: ((context, child) => const MyApp()),
  ));
  // ...to here.
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

class ApplicationState extends ChangeNotifier {
  ApplicationState() {
    Future<void> init() async {
      await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform);

      FirebaseUIAuth.configureProviders([
        EmailAuthProvider(),
      ]);

      FirebaseAuth.instance.userChanges().listen((user) {
        if (user != null) {
          _loggedIn = true;
        } else {
          _loggedIn = false;
        }
        notifyListeners();
      });
    }

    init();
  }

  bool _loggedIn = false;
  bool get loggedIn => _loggedIn;

  Future<void> init() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);

    FirebaseUIAuth.configureProviders([
      EmailAuthProvider(),
    ]);

    FirebaseAuth.instance.userChanges().listen((user) {
      if (user != null) {
        _loggedIn = true;
      } else {
        _loggedIn = false;
      }
      notifyListeners();
    });
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var tasks = [
    'Task 1',
    'Task 2',
    'Task 3',
    'Task 4',
    'Task 5',
  ];
  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Item To Add'),
            content: DropdownButtonFormField(
              items: tasks.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (value) {},
              decoration: const InputDecoration(hintText: "What did you do?"),
            ),
            actions: <Widget>[
              ElevatedButton(
                  key: const Key("OKButton"),
                  child: const Text("Ok"),
                  onPressed: () {}),

              // https://stackoverflow.com/questions/52468987/how-to-turn-disabled-button-into-enabled-button-depending-on-conditions
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Friends of the Farm',
            style: GoogleFonts.lobster(fontSize: 35)),
      ),
      body: Column(mainAxisSize: MainAxisSize.min, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Image.asset('assets/logo.png'),
            //const SizedBox(height: 8),
            //const IconAndDetail(Icons.calendar_today, 'October 30'),
            //const IconAndDetail(Icons.location_city, 'San Francisco'),
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
            //crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (appState.loggedIn) ...[
                Text(
                  'Tasks',
                  style: GoogleFonts.lobster(fontSize: 32),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: UserHomePage(),
                ),
              ],
            ],
          ),
        ),
      ]),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _displayTextInputDialog(context);
        },
        label: Text('Log Hours'),
        icon: Icon(Icons.timer),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.lightBlue.shade100, Colors.blueGrey])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Friends of the Farm',
                textAlign: TextAlign.center,
                style:
                    GoogleFonts.lobster(fontSize: 70.0, color: Colors.white)),
            TextButton(
                child: Text("Login/Signup".toUpperCase(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white)),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.blueGrey.shade400),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.all(15)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.blueGrey)))),
                onPressed: () =>
                    Navigator.of(context).pushReplacementNamed('/sign-in')),
          ],
        ),
      ),
    );
  }
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
    return MaterialApp(
      //Start adding here
      initialRoute: '/home',
      routes: {
        '/home': (context) {
          return Consumer<ApplicationState>(
              builder: (context, appState, _) =>
                  appState.loggedIn ? const HomePage() : const LoginPage());
        },
        '/sign-in': ((context) {
          return SignInScreen(
            actions: [
              ForgotPasswordAction(((context, email) {
                Navigator.of(context)
                    .pushNamed('/forgot-password', arguments: {'email': email});
              })),
              AuthStateChangeAction(((context, state) {
                if (state is SignedIn || state is UserCreated) {
                  var user = (state is SignedIn)
                      ? state.user
                      : (state as UserCreated).credential.user;
                  if (user == null) {
                    return;
                  }
                  if (state is UserCreated) {
                    user.updateDisplayName(user.email!.split('@')[0]);
                  }
                  if (!user.emailVerified) {
                    user.sendEmailVerification();
                    const snackBar = SnackBar(
                        content: Text(
                            'Please check your email to verify your email address'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                  Navigator.of(context).pushReplacementNamed('/home');
                }
              })),
            ],
          );
        }),
        '/forgot-password': ((context) {
          final arguments = ModalRoute.of(context)?.settings.arguments
              as Map<String, dynamic>?;

          return ForgotPasswordScreen(
            email: arguments?['email'] as String,
            headerMaxExtent: 200,
          );
        }),
        '/profile': ((context) {
          return ProfileScreen(
            providers: [],
            actions: [
              SignedOutAction(
                ((context) {
                  Navigator.of(context).pushReplacementNamed('/home');
                }),
              ),
            ],
          );
        }),
      },
      // end adding here
      theme: ThemeData(
        buttonTheme: Theme.of(context).buttonTheme.copyWith(
              highlightColor: Colors.black,
            ),
        primarySwatch: Colors.blueGrey,
        textTheme: GoogleFonts.notoSerifTextTheme(
          Theme.of(context).textTheme,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
