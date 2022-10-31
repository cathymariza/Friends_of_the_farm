import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: UserHomePage(),
    );
  }
}

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Home'),
      ),
      body: Column(mainAxisSize: MainAxisSize.min, children: [
        const Text('Your Next Tasks:'),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              ListTile(
                leading: Icon(Icons.apple),
                title: const Text('Water Garden Plots XYZ'),
                subtitle: const Text('10:30 AM'),
              ),
              ListTile(
                leading: Icon(Icons.catching_pokemon),
                title: const Text('Feed the Chickens'),
                subtitle: const Text('11:00 AM'),
              ),
            ],
          ),
        ),
        ElevatedButton(
          key: const Key("LoginButton"),
          style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
              primary: Colors.blueAccent),
          child: const Text('See Hours Worked'),
          onPressed: () {},
        ),
      ]),
    );
  }
}
