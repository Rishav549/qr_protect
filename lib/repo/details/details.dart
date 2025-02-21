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
