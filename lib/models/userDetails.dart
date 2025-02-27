import 'package:cloud_firestore/cloud_firestore.dart';

class UserDetails {
  String name;
  String phone;
  String address;
  String image;
  String vehicle;
  String bloodGrp;
  String height;
  String weight;
  String medication;
  String name1;
  String phone1;
  String name2;
  String phone2;
  String name3;
  String phone3;

  UserDetails({
    required this.name,
    required this.phone,
    required this.address,
    required this.image,
    required this.vehicle,
    required this.bloodGrp,
    required this.height,
    required this.weight,
    required this.medication,
    required this.name1,
    required this.phone1,
    required this.name2,
    required this.phone2,
    required this.name3,
    required this.phone3,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return UserDetails(
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      address: json['address'] ?? '',
      image: json['image'] ?? '',
      vehicle: json['vehicle'] ?? '',
      bloodGrp: json['bloodGrp'] ?? '',
      height: json['height'] ?? '',
      weight: json['weight'] ?? '',
      medication: json['medication'] ?? '',
      name1: json['name1'] ?? '',
      phone1: json['phone1'] ?? '',
      name2: json['name2'] ?? '',
      phone2: json['phone2'] ?? '',
      name3: json['name3'] ?? '',
      phone3: json['phone3'] ?? '',
    );
  }

  factory UserDetails.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return UserDetails(
      name: doc['name'] ?? '',
      phone: doc['phone'] ?? '',
      address: doc['address'] ?? '',
      image: doc['image'] ?? '',
      vehicle: doc['vehicle'] ?? '',
      bloodGrp: doc['bloodGrp'] ?? '',
      height: doc['height'] ?? '',
      weight: doc['weight'] ?? '',
      medication: doc['medication'] ?? '',
      name1: doc['name1'] ?? '',
      phone1: doc['phone1'] ?? '',
      name2: doc['name2'] ?? '',
      phone2: doc['phone2'] ?? '',
      name3: doc['name3'] ?? '',
      phone3: doc['phone3'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'address': address,
      'vehicle': vehicle,
      'image': image,
      'bloodGrp': bloodGrp,
      'height': height,
      'weight': weight,
      'medication': medication,
      'name1': name1,
      'phone1': phone1,
      'name2': name2,
      'phone2': phone2,
      'name3': name3,
      'phone3': phone3,
    };
  }
}
