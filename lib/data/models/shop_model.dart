import 'package:cloud_firestore/cloud_firestore.dart';

class ShopModel {
  final String name;
  final String email;
  final String whatsapp;
  final String phone;
  final String password;
  final String shopname;
  final GeoPoint shoplocation;
  final String description;
  final String startingtime;
  final String closingtime;
  final String licenceimagepath;
  final String mmimagepath;
  final String bannerimagepath;
  final bool isApproved;
  final bool isRejected;
  final String locationaddress;
  final List<String> bodyservicemap;
  final List<String> interiorservicemap;
  final List<String> enginservicemap;
  ShopModel({
    required this.name,
    required this.email,
    required this.whatsapp,
    required this.phone,
    required this.password,
    required this.shopname,
    required this.shoplocation,
    required this.description,
    required this.startingtime,
    required this.closingtime,
    required this.licenceimagepath,
    required this.mmimagepath,
    required this.bannerimagepath,
    required this.isApproved,
    required this.bodyservicemap,
    required this.interiorservicemap,
    required this.enginservicemap,
    required this.isRejected,
    required this.locationaddress,
  });
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "whatsapp": whatsapp,
      "phone": phone,
      "password": password,
      "shopname": shopname,
      "location": shoplocation,
      "description": description,
      "startingtime": startingtime,
      "closingtime": closingtime,
      "licenceimagepath": licenceimagepath,
      "mmimagepath": mmimagepath,
      "bannerimagepath": bannerimagepath,
      "isApproved": isApproved,
      "isRejected": isRejected,
      "bodyservicemap": bodyservicemap,
      "interiorservicemap": interiorservicemap,
      "enginservicemap": enginservicemap,
      "locationaddress": locationaddress
    };
  }
}
