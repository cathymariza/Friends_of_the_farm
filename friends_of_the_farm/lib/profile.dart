// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'dart:async'; // new
// import 'package:cloud_firestore/cloud_firestore.dart'; // new
// import 'package:firebase_auth/firebase_auth.dart' // new
//     hide
//         EmailAuthProvider,
//         PhoneAuthProvider; 
//     // new
// import 'package:firebase_auth/firebase_auth.dart'
//     show
//         ActionCodeSettings,
//         FirebaseAuth,
//         FirebaseAuthException,
//         MultiFactorInfo,
//         PhoneAuthCredential,
//         PhoneMultiFactorGenerator,
//         User;
// import 'package:firebase_ui_auth/src/widgets/internal/universal_icon.dart';
// import 'package:flutter/cupertino.dart' hide Title;
// import 'package:firebase_ui_localizations/firebase_ui_localizations.dart';  
// import 'package:firebase_core/firebase_core.dart'; // new
// import 'package:firebase_ui_auth/firebase_ui_auth.dart'; // new
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart'; // new

// import 'firebase_options.dart'; // new
// import 'src/authentication.dart'; // new
// import 'src/widgets.dart';
// import 'package:firebase_ui_oauth/firebase_ui_oauth.dart'
//     hide OAuthProviderButtonBase;
// import 'package:flutter/services.dart';

// import 'package:firebase_ui_auth/src/widgets/internal/loading_button.dart';
// import 'package:firebase_ui_auth/src/widgets/internal/universal_button.dart';
// import 'package:firebase_ui_auth/src/widgets/internal/rebuild_scope.dart';
// import 'package:firebase_ui_auth/src/widgets/internal/subtitle.dart';
// import 'package:firebase_ui_auth/src/widgets/internal/universal_icon_button.dart';

// import 'internal/multi_provider_screen.dart';

// class ProfilePage extends StatefulWidget {
//   const ProfilePage({
//     Key? key,
//     FirebaseAuth? auth,
//     List<AuthProvider>? providers,
//     this.avatarPlaceholderColor,
//     this.avatarShape,
//     this.avatarSize,
//     this.children = const [],
//     this.actions,
//     this.appBar,
//     this.cupertinoNavigationBar,
//     this.actionCodeSettings,
//     this.showMFATile = false,
//   }) : super(key: key, providers: providers, auth: auth);

//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   Future<bool> _reauthenticate(BuildContext context) {
//     final l = FirebaseUILocalizations.labelsOf(context);

//     return showReauthenticateDialog(
//       context: context,
//       providers: providers,
//       auth: auth,
//       onSignedIn: () => Navigator.of(context).pop(true),
//       actionButtonLabelOverride: l.deleteAccount,
//     );
//   }

//   List<AuthProvider> getLinkedProviders(User user) {
//     return providers
//         .where((provider) => user.isProviderLinked(provider.providerId))
//         .toList();
//   }

//   List<AuthProvider> getAvailableProviders(BuildContext context, User user) {
//     final platform = Theme.of(context).platform;

//     return providers
//         .where(
//           (provider) =>
//               !user.isProviderLinked(provider.providerId) &&
//               provider.supportsPlatform(platform),
//         )
//         .toList();
//   }


// }
