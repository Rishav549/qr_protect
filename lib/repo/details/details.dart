import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qr_protect/models/userDetails.dart';
import 'package:qr_protect/utilities/localStorage.dart';
import 'package:qr_protect/utilities/logger.dart';

Future<void> detailsAdd(UserDetails details) async {
  String uid = await SecureLocalStorage.getValue("uid");
  try {
    FirebaseFirestore.instance
        .collection('data')
        .doc(uid)
        .set(details.toJson());
  } catch (e) {
    CustomLogger.error(e);
  }
}

Future<UserDetails?> detailsFetch(String number) async {
  String uid = await SecureLocalStorage.getValue("uid");
  try {
    DocumentSnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('data').doc(uid).get();
    return UserDetails.fromFirestore(querySnapshot);
  } catch (e) {
    CustomLogger.error(e);
  }
}
