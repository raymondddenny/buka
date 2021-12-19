import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthProvider extends ChangeNotifier {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;
  User? _userSigned;

  User get userSigned => _userSigned!;

  GoogleSignInAccount get user => _user!;

  // Future getCurrentUserData() async {
  //   final currentUser = auth.currentUser;

  //   final userData = await firestore.collection("users").where('uid', isEqualTo: currentUser!.uid).get();
  // }

  Future<void> addUser(User user) {
    // Call the user's CollectionReference to add a new user
    return users.doc(user.uid).set({
      'full_name': user.displayName, // John Doe
      'email': user.email, // Stokes and Sons
      'photoUrl': user.photoURL, // 42
      'uid': user.uid,
    }).then((value) async {
      print("User Added");
      _userSigned = user;
    }).catchError((error) => print("Failed to add user: $error"));
  }

  Future<bool> userExists(String uid) async {
    return (await firestore.collection("users").where('uid', isEqualTo: uid).get()).docs.length > 1;
  }

  Future<DocumentSnapshot> getUserDoc() async {
    final user = auth.currentUser;
    final ref = firestore.collection('users').doc(user!.uid).get();
    return ref;
  }

  Future googleLogin() async {
    try {
      final googleUser = await googleSignIn.signIn();

      if (googleUser == null) return;
      _user = googleUser;

      final googleAuth = await googleUser.authentication;

      final credential =
          GoogleAuthProvider.credential(accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

      final checkUserExist = await userExists(userCredential.user!.uid);

      if (!checkUserExist) {
        addUser(userCredential.user!);
      }

      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }

  Future signOut() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}
