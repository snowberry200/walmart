import 'dart:async';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  Database();

  final firestore = FirebaseFirestore.instance;

  // This should be for SIGN IN - checking if user exists
  Future<Map<String, dynamic>> getinfo(
      {required String username, required String pass}) async {
    try {
      // Query to find user with matching email and password
      final querySnapshot = await firestore
          .collection('credential')
          .where('user', isEqualTo: username)
          .where('password', isEqualTo: pass)
          .limit(1)
          .get();

      if (querySnapshot.docs.isEmpty) {
        throw Exception('Invalid email or password');
      }

      // Return user data
      final userData = querySnapshot.docs.first.data();
      log('User found: $userData');
      return userData;
    } catch (e) {
      log('getinfo error: $e');
      rethrow; // IMPORTANT: rethrow so Bloc can catch the error
    }
  }

  Future<void> signUp({
    required String? name,
    required String username,
    required String pass,
  }) async {
    try {
      log('🔍 Testing Firestore connection...');

      // Test if we can write to Firestore
      final testData = {
        'test': 'connection',
        'timestamp': FieldValue.serverTimestamp(),
      };

      await firestore.collection('test_connection').add(testData);
      log('✅ Firestore connection test: SUCCESS');

      // Continue with your actual signup logic...
      final existingUser = await firestore
          .collection('credential')
          .where('user', isEqualTo: username)
          .limit(1)
          .get();

      // ... rest of your signup code
    } catch (e) {
      log('❌ Firestore error: $e');
      log('❌ This is likely a security rules issue!');
      rethrow;
    }
  }

  // // This should be for SIGN UP - creating new user
  // Future<void> signUp({
  //   required String? name,
  //   required String username,
  //   required String pass,
  // }) async {
  //   try {
  //     // First check if user already exists
  //     final existingUser = await firestore
  //         .collection('credential')
  //         .where('user', isEqualTo: username)
  //         .limit(1)
  //         .get();

  //     if (existingUser.docs.isNotEmpty) {
  //       throw Exception('User with this email already exists');
  //     }

  //     // Create new user
  //     final data = {
  //       'name': name,
  //       'user': username,
  //       'password': pass,
  //       'createdAt': FieldValue.serverTimestamp(),
  //     };

  //     // Add to Firestore and wait for completion
  //     await firestore.collection('credential').add(data);

  //     log('User created successfully: $username');
  //   } catch (e) {
  //     log('signUp error: $e');
  //     rethrow; // IMPORTANT: rethrow so Bloc can catch the error
  //   }
  // }
}
