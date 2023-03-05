import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:device_preview/device_preview.dart';
import 'package:walmart/main_screens/firebase_options.dart';
import 'main_screens/layout.dart';

// import 'package:walmart/screens/authentication.dart';
// import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const MaterialApp(
        debugShowCheckedModeBanner: false, home: AuthenticateWrapper()),
  );
  //AuthenticateWrapper()));
}
// ignore_for_file: non_constant_identifier_names

class AuthenticateWrapper extends StatelessWidget {
  const AuthenticateWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Layout();
  }
}
