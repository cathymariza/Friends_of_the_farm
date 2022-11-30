import 'package:flutter/material.dart';

import 'widgets.dart';

class AuthFunc extends StatelessWidget {
  const AuthFunc({
    super.key,
    required this.loggedIn,
    required this.signOut,
  });

  final bool loggedIn;
  final void Function() signOut;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: StyledButton(
              onPressed: () {
                !loggedIn
                    ? Navigator.of(context).pushNamed('/sign-in')
                    : signOut();
              },
              child: !loggedIn
                  ? const Text('Sign In')
                  : const Text(
                      'Logout')), // this is where you change the sign in button
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12)
        ),
        Visibility(
            visible: loggedIn,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: StyledButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/profile');
                  },
                  child: const Text('Profile')),
            ))
      ],
    );
  }
}
