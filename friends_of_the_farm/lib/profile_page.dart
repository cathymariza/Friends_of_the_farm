import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),

      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).backgroundColor
            ),
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
      )
    );
  }
}