import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          elevation: 0.0,
          backgroundColor: CupertinoColors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: const BorderSide(width: 1)),
          minimumSize: const Size.fromHeight(50),
          fixedSize: const Size(150, 30)),
      child: const Text(
        'Create account',
        style: TextStyle(
            decorationThickness: 1,
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: CupertinoColors.black),
      ),
    );
  }
}
