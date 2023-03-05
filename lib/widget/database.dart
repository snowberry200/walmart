import 'dart:async';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  String username;
  dynamic pass;
  Database({required this.username, required this.pass});

  final firestore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>> getinfo() async {
    CollectionReference credential = firestore.collection('credential');
    late Map<String, dynamic> data = {'user': username, 'password': pass};

    try {
      await credential.add(data);
    } catch (e) {
      log(e.toString());
    }
    return data;
  }
}
