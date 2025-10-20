import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:walmart/password_user_page/password_layout.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    Key? key,
    required this.formkey,
    required TextEditingController email,
  })  : _email = email,
        super(key: key);

  final GlobalKey<FormState> formkey;
  final TextEditingController _email;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 37, 98, 228),
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

          // if (formkey.currentState!.validate()) {
          //   Navigator.of(context).push(
          //     MaterialPageRoute(
          //       builder: (context) => PasswordLayout(
          //         email: _email.text,
          //       ),
          //     ),
          //   );
          // }
        },
        child: const Text('Continue',
            style: TextStyle(color: CupertinoColors.white)));
  }
}
