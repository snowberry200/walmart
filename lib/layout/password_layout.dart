import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walmart/bloc/auth_bloc.dart';
import 'package:walmart/widget/database.dart';

import '../password_screens/password_desktop.dart';
import '../password_screens/password_mobile_form.dart';
import '../password_screens/password_tablet.dart';

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
    return BlocProvider(
      create: (context) => AuthBloc(database: Database()),
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 1200) {
          return PasswordDesktop(callback: widget.email);
        } else if (constraints.maxWidth > 670 && constraints.maxWidth < 1200) {
          return PasswordTablet(callback: widget.email);
        } else {
          return PasswordMobileForm(callback: widget.email);

          //sending this callbackFunction to PasswordMobileForm()
        }
      }),
    );

//  void parentChange(newString) {setState(() {
//     email=newString;

//   });}
  }
}
