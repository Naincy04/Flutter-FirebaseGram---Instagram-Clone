import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram/resources/storage_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future<String> signUpUser(
      {required String email,
      required String password,
      required String username,
      required String bio,
      required Uint8List file}) async {
    String res = "Some error occurred";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty ||
          file != null) {
        // Register user

        UserCredential userCred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        // String photoUrl = await StorageMethods()
        //     .uploadImageToStorage('profilePics', file, false);

        // // Add user data to database
        // await _fireStore.collection('users').doc(userCred.user!.uid).set({
        //   'email': email,
        //   'password': password,
        //   'bio': bio,
        //   'username': username,
        //   'followers': [],
        //   'following': [],
        //   'profileImage': photoUrl,
        // });
      }

      res = "success";
    } catch (error) {
      res = error.toString();
    }
    return res;
  }
}
