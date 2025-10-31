import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walmart/bloc/auth_bloc.dart' show AuthBloc;
import 'package:walmart/bloc/auth_event.dart';
import 'package:walmart/widget/email_text_field.dart';
import 'package:walmart/widget/name_textfield.dart';
import 'package:walmart/widget/password_field.dart';
import 'package:walmart/widget/submit_button.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({Key? key}) : super(key: key);

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isSignedIn = true;

  Future<void> _swap() async {
    setState(() {
      isSignedIn = !isSignedIn;
      formKey.currentState?.reset();
    });
  }

  void _handleSubmit(String value) {
    if (formKey.currentState!.validate()) {
      final email = emailController.text.trim();
      final name = nameController.text.trim();
      final password = passwordController.text.trim();

      if (isSignedIn) {
        // Login logic
        context.read<AuthBloc>().add(EmailContinueEvent(email: email));
      } else {
        // Sign up logic
        context
            .read<AuthBloc>()
            .add(SignUpEvent(email: email, name: name, password: password));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          EmailTextField(
            controller: emailController,
          ),
          const SizedBox(height: 20),
          if (!isSignedIn) ...[
            NameTextFormWidget(
              nameController: nameController,
            ),
            const SizedBox(height: 20),
            PasswordTextfield(),
            const SizedBox(height: 20),
          ],
          const SizedBox(height: 25),
          SubmitButton(
            formkey: formKey,
            emailController: emailController,
            name: nameController.text,
            password: passwordController,
            handleLogin: _handleSubmit,
          ),
          const SizedBox(height: 20),
          const Text(
            "Don't have an account?",
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _swap,
            style: ElevatedButton.styleFrom(
                elevation: 0.0,
                backgroundColor: CupertinoColors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: const BorderSide(width: 1)),
                minimumSize: const Size.fromHeight(50),
                fixedSize: const Size(150, 30)),
            child: Text(
              isSignedIn ? 'Create account' : 'sign in',
              style: TextStyle(
                  decorationThickness: 1,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: CupertinoColors.black),
            ),
          ),
        ],
      ),
    );
  }
}
