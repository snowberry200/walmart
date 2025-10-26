import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walmart/bloc/auth_bloc.dart';
import 'package:walmart/bloc/auth_event.dart';

class SubmitButton extends StatefulWidget {
  final GlobalKey<FormState> formkey;
  final TextEditingController
      emailController; // Accept controller instead of string

  const SubmitButton({
    Key? key,
    required this.formkey,
    required this.emailController,
  }) : super(key: key);

  @override
  State<SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  void _handleLogin() {
    if (widget.formkey.currentState!.validate()) {
      final email = widget.emailController.text.trim();
      if (email.isNotEmpty) {
        if (mounted) {
          context.read<AuthBloc>().add(EmailContinueEvent(email: email));
        }
      }
    }
  }

  bool isSignedIn = true;

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
        _handleLogin();
      },
      child: const Text(
        'Continue',
        style: TextStyle(color: CupertinoColors.white),
      ),
    );
  }
}
