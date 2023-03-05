import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'others.dart';
import '../password_user_page/password_layout.dart';

class DesktopScreen extends StatefulWidget {
  const DesktopScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<DesktopScreen> createState() => _DesktopScreenState();
}

class _DesktopScreenState extends State<DesktopScreen> {
  final TextEditingController _email = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    Text _text = const Text(
      'Sign in to your Walmart account',
      style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'BogleWeb'),
    );

    final emailfield = TextFormField(
        cursorColor: Colors.blue,
        enableIMEPersonalizedLearning: true,
        selectionControls: CupertinoTextSelectionControls(),
        textCapitalization: TextCapitalization.none,
        enableInteractiveSelection: true,
        autofillHints: const [AutofillHints.email],
        controller: _email,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.emailAddress,
        onSaved: (value) => _email.text = value!,
        decoration: const InputDecoration(
            focusedBorder: OutlineInputBorder(),
            focusColor: CupertinoColors.black,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            labelText: 'Email Addess',
            contentPadding: EdgeInsets.all(10)),
        validator: (ifemail) =>
            !EmailValidator.validate(ifemail!) ? 'Enter a valid email' : null);

    final button = ElevatedButton(
      child: const Text('Continue'),
      style: ElevatedButton.styleFrom(
        elevation: 0, backgroundColor: const Color.fromARGB(255, 37, 98, 228),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        minimumSize: const Size.fromHeight(50),
        fixedSize: const Size(150, 30),
      ),
      onPressed: () async {
        if (formkey.currentState!.validate()) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PasswordLayout(
                email: _email.text,
              ),
            ),
          );
        }
      },
    );

    Text _text1 = const Text(
      "Don't have an account?",
      style: TextStyle(fontSize: 16),
    );
    final button1 = ElevatedButton(
      onPressed: () {},
      child: const Text(
        'Create account',
        style: TextStyle(
            decorationThickness: 1,
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: CupertinoColors.black),
      ),
      style: ElevatedButton.styleFrom(
          elevation: 0.0, backgroundColor: CupertinoColors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: const BorderSide(width: 1)),
          minimumSize: const Size.fromHeight(50),
          fixedSize: const Size(150, 30)),
    );
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(
          top: 50,
        ),
        child: Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              image: DecorationImage(
                  image: NetworkImage(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Walmart_Spark.svg/1925px-Walmart_Spark.svg.png'),
                  fit: BoxFit.fill)),
        ),
      ),
      const SizedBox(height: 30),
      _text,
      const SizedBox(height: 10),
      Center(
        child: SizedBox(
          width: _width / 3,
          child: Form(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 10, left: 20, right: 20),
              child: emailfield,
            ),
            key: formkey,
          ),
        ),
      ),
      SizedBox(
        width: _width / 3,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 30, bottom: 10, left: 20, right: 20),
          child: button,
        ),
      ),
      SizedBox(
        width: _width / 3,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 10),
            child: _text1,
          ),
        ),
      ),
      SizedBox(
        width: _width / 3,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 20, bottom: 10, left: 20, right: 20),
          child: button1,
        ),
      ),
      const SizedBox(height: 80),
      BottomAppBar(
        elevation: 0,
        child: Padding(
          padding:
              const EdgeInsets.only(bottom: 20.0, left: 10, top: 0, right: 10),
          child: InkWell(
            hoverColor: Colors.white,
            splashColor: Colors.white,
            onTap: () {},
            child: const OthersInfos(),
          ),
        ),
      ),
    ]);
  }
}
