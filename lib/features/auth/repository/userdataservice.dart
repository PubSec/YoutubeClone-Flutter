import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:youtube_clone/features/auth/model/usermodel.dart';

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
    required List<String> subscriptions,
    required int videos,
    required String userID,
    required String description,
    required String type,
  }) async {
    UserModel user = UserModel(
      displayName: displayName,
      username: username,
      email: email,
      profilePicture: profilePicture,
      subscriptions: subscriptions,
      videos: videos,
      userID: userID,
      description: description,
      type: type,
    );
  }
}
