import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../utilities/logger.dart';

Future<bool> checkLoggedIn() async {
  try {
    if (FirebaseAuth.instance.currentUser != null) {
      return true;
    } else {
      return false;
    }
  } catch (e) {
    CustomLogger.error(e);
    return false;
  }
}

Future<UserCredential?> signInWithEmailAndPassword(
    String email, String password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    CustomLogger.info(userCredential);
    return userCredential;
  } catch (e) {
    CustomLogger.error(e);
  }
  return null;
}

Future<bool?> checkNumberExist(String email) async {
  try {
    final snapshot = await FirebaseFirestore.instance
        .collection('activeUser')
        .where('email', isEqualTo: email)
        .get();
    if (snapshot.docs.isEmpty) {
      return false;
    } else {
      return true;
    }
  } catch (e) {
    CustomLogger.error(e);
  }
}

Future<UserCredential?> addUser(String email, String password) async {
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // FirebaseFirestore.instance.collection('activeUser').add({
    //   'email': email,
    //   'active': true,
    // });

    return userCredential;
  } catch (e) {
    CustomLogger.error(e);
    return null;
  }
}

Future<void> logOutUser() async {
  try {
    await FirebaseAuth.instance.signOut();
    CustomLogger.info("Signed Out");
  } catch (e) {
    CustomLogger.error(e);
  }
}
