import 'package:flutter/material.dart';
import 'package:friends_of_the_farm/user_home.dart';
import 'package:friends_of_the_farm/main.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading:
              CircleAvatar(backgroundColor: Theme.of(context).backgroundColor),
          title: const Text('Sample User'),
          subtitle: const Text('user@sample.com'),
        ),
        const Text('Your Task Groups'),
        Padding(
            padding: const EdgeInsets.only(left: 8.0), child: UserHomePage()),
      ],
    );
  }
}
