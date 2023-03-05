import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'others.dart';
import '../password_user_page/password_layout.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  final TextEditingController _email = TextEditingController();
  ScrollController scrollcontroller = ScrollController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
    return Scaffold(
        backgroundColor: CupertinoColors.white,
        body: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 50,
                ),
                child: Center(
                  child: Container(
                    //width: _width / 2,
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
              ),
              const SizedBox(height: 30),
              _text,
              const SizedBox(height: 10),
              Center(
                child: Form(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 20, bottom: 10, left: 40, right: 40),
                    child: emailfield,
                  ),
                  key: formkey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 30, bottom: 10, left: 40, right: 40),
                child: button,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: _text1,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 20, bottom: 10, left: 40, right: 40),
                child: button1,
              ),
              const SizedBox(height: 60),
              const Divider(
                color: Colors.grey,
                thickness: 0.2,
              ),
              BottomAppBar(
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.only(
                      bottom: 20.0, left: 20, top: 0, right: 20),
                  child: InkWell(
                    onTap: () {},
                    hoverColor: Colors.white,
                    splashColor: Colors.white,
                    child: const OthersInfos(),
                  ),
                ),
              ),
            ]),
          ),
        ));
  }
}
