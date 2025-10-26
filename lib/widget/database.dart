import 'dart:async';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  Database();

  final firestore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>> getinfo(
      {required String username, required dynamic pass}) async {
    CollectionReference credential = firestore.collection('credential');
    late Map<String, dynamic> data = {'user': username, 'password': pass};

    try {
      await credential.add(data);
    } catch (e) {
      log(e.toString());
    }
    return data;
  }

  Future<void> signUp(
      {required String name,
      required String username,
      required dynamic pass}) async {
    CollectionReference credential = firestore.collection('credential');
    late Map<String, dynamic> data = {
      'name': name,
      'user': username,
      'password': pass
    };

    try {
      await credential.add(data);
    } catch (e) {
      log(e.toString());
    }
  }
}
