import 'package:cloud_firestore/cloud_firestore.dart';

class ShopModel {
  final String name;
  final String email;
  final String whatsapp;
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
  final Map<String, dynamic> bodyservicemap;
  final Map<String, dynamic> interiorservicemap;
  final Map<String, dynamic> enginservicemap;
  ShopModel({
    required this.name,
    required this.email,
    required this.whatsapp,
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
  });
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "whatsapp": whatsapp,
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
      "bodyservicemap": bodyservicemap,
      "interiorservicemap": interiorservicemap,
      "enginservicemap": enginservicemap,
    };
  }
}
