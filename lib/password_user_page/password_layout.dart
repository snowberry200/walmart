import 'package:flutter/cupertino.dart';

import 'password_desktop.dart';
import 'password_mobile.dart';
import 'password_tablet.dart';

class PasswordLayout extends StatefulWidget {
  final String email;

  const PasswordLayout({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  State<PasswordLayout> createState() => _PasswordLayoutState();
}

class _PasswordLayoutState extends State<PasswordLayout> {
  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth > 1200) {
        return PasswordDesktop(callback: widget.email);
      } else if (constraints.maxWidth > 670 && constraints.maxWidth < 1200) {
        return PasswordTablet(callback: widget.email);
      } else {
        return PasswordMobile(callback: widget.email);

        //sending this callbackFunction to passwordMobile()

      }
    });

//  void parentChange(newString) {setState(() {
//     email=newString;

//   });}
  }
}
