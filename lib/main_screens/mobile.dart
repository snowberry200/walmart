import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:walmart/main_screens/email_text_field.dart';
import 'package:walmart/main_screens/image_container.dart';
import 'package:walmart/main_screens/sign_up_button.dart';
import 'package:walmart/main_screens/submit_button.dart';

import 'others.dart';

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
    Text text = const Text(
      'Sign in to your Walmart account',
      style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'BogleWeb'),
    );

    Text text1 = const Text(
      "Don't have an account?",
      style: TextStyle(fontSize: 16),
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
                  top: 30,
                  bottom: 30,
                ),
                child: ImageContainer(),
              ),
              text,
              const SizedBox(height: 10),
              Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0.0, horizontal: 50),
                  child: Form(
                    key: formkey,
                    child: Column(
                      children: [
                        EmailTextField(email: _email),
                        const SizedBox(height: 20),
                        SubmitButton(formkey: formkey, email: _email),
                        const SizedBox(height: 20),
                        text1,
                        const SizedBox(height: 20),
                        SignUpButton(),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 60),
              const Divider(
                color: Colors.grey,
                thickness: 0.2,
              ),
              SizedBox(
                height: 200,
                child: BottomAppBar(
                  color: Colors.transparent,
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        bottom: 0.0, left: 20, top: 0, right: 20),
                    child: const OthersInfos(),
                  ),
                ),
              ),
            ]),
          ),
        ));
  }
}
