import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qr_protect/models/userDetails.dart';
import 'package:qr_protect/utilities/logger.dart';

Future<void> detailsAdd(UserDetails details) async {
  try {
    FirebaseFirestore.instance.collection('data').doc().set(details.toJson());
  } catch (e) {
    CustomLogger.error(e);
  }
}

Future<UserDetails?> detailsFetch(String number) async {
  try {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('data')
        .where('phone', isEqualTo: number)
        .get();
    return UserDetails.fromFirestore(querySnapshot.docs.first);
  } catch (e) {
    CustomLogger.error(e);
  }
}
