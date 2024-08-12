// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/features/channel/mychannel/pages/mychannel.dart';
// import 'package:youtube_clone/homeview.dart';
// import 'package:youtube_clone/features/auth/pages/login_view.dart';
// import 'package:youtube_clone/features/auth/pages/usernameview.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: StreamBuilder(
        //   stream: FirebaseAuth.instance.authStateChanges(),
        //   builder: (context, snapshot) {
        //     if (!snapshot.hasData) {
        //       return const LoginView();
        //     } else if (snapshot.connectionState == ConnectionState.waiting) {
        //       return const CircularProgressIndicator();
        //     }
        //     return StreamBuilder(
        //       stream: FirebaseFirestore.instance
        //           .collection('users')
        //           .doc(FirebaseAuth.instance.currentUser!.uid)
        //           .snapshots(),
        //       builder: (context, snapshot) {
        //         final user = FirebaseAuth.instance.currentUser;
        //         if (!snapshot.hasData || !snapshot.data!.exists) {
        //           return Usernameview(
        //               user!.displayName!, user.photoURL!, user.email!);
        //         } else if (snapshot.connectionState == ConnectionState.waiting) {
        //           const CircularProgressIndicator();
        //         }
        home: MyChannelView());
  }
}
//       ),
//     );
//   }
// }
