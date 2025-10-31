import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walmart/bloc/auth_bloc.dart';
import 'package:walmart/bloc/auth_event.dart';

class SubmitButton extends StatefulWidget {
  final GlobalKey<FormState> formkey;
  final TextEditingController emailController;
  final String? name;
  final dynamic password;

  const SubmitButton({
    Key? key,
    required this.formkey,
    required this.emailController,
    required this.name,
    required this.password,
  }) : super(key: key);

  @override
  State<SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  late TextEditingController emailController;
  late String? name;
  late dynamic password;
  @override
  void initState() {
    super.initState();
    emailController = widget.emailController;
    name = widget.name;
    password = widget.password;
  }

  void _handleLogin() {
    if (widget.formkey.currentState!.validate()) {
      final email = emailController.text.trim();
      final name = this.name;
      final password = this.password;
      if (email.isNotEmpty) {
        if (mounted) {
          context.read<AuthBloc>().add(EmailContinueEvent(email: email));
        } else {
          context
              .read<AuthBloc>()
              .add(SignUpEvent(email: email, name: name, password: password));
        }
      }
    }
  }

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
