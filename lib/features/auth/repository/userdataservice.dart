import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/features/auth/model/usermodel.dart';

final userDataServiceProvider = Provider(
  (ref) => UserDataService(
      auth: FirebaseAuth.instance,
      firebaseFirestore: FirebaseFirestore.instance),
);

class UserDataService {
  FirebaseAuth auth;
  FirebaseFirestore firebaseFirestore;

  UserDataService({
    required this.auth,
    required this.firebaseFirestore,
  });

  addUserDataFirestore({
    required String displayName,
    required String username,
    required String email,
    required String profilePicture,
    required String description,
  }) async {
    UserModel user = UserModel(
      displayName: displayName,
      username: username,
      email: email,
      profilePicture: profilePicture,
      subscriptions: [],
      videos: 0,
      userID: auth.currentUser!.uid,
      description: description,
      type: 'user',
    );
    await firebaseFirestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .set(user.toJson());
  }
}
