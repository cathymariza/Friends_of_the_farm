// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'dart:async'; // new
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:provider/provider.dart'; // new


// class ProfilePage extends StatelessWidget {
//   const ProfilePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: <Widget>[
//           FutureBuilder(
//             future: Provider.of(context).auth.getCur,
//             builder: context, snapshot)
//         ],
//       ),
//     );
//   }
// }