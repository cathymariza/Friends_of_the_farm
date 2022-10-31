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
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static List<Widget> _pages = <Widget>[
    Column(mainAxisSize: MainAxisSize.min, children: [
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
        key: const Key("HoursWorked"),
        style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(fontSize: 20),
            primary: Colors.blueAccent),
        child: const Text('See Hours Worked'),
        onPressed: () {},
      ),
    ]),
    Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: CircleAvatar(),
          title: const Text('Admin'),
          subtitle: const Text('admin@sample.com'),
        ),
        const Text('Groups You Manage'),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              ListTile(
                leading: Icon(Icons.apple),
                title: Text('Community Garden'),
              ),
              ListTile(
                leading: Icon(Icons.catching_pokemon),
                title: Text('Chickens'),
              ),
            ],
          ),
        ),
        ElevatedButton(
          key: const Key("Assign Task"),
          style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
              primary: Colors.blueAccent),
          child: const Text('Assign A Task'),
          onPressed: () {},
        ),
      ],
    ),
    Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: CircleAvatar(),
          title: const Text('Sample User'),
          subtitle: const Text('user@sample.com'),
        ),
        const Text('Your Task Groups'),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              ListTile(
                leading: Icon(Icons.apple),
                title: Text('Community Garden'),
              ),
              ListTile(
                leading: Icon(Icons.catching_pokemon),
                title: Text('Chickens'),
              ),
            ],
          ),
        ),
      ],
    ),
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
