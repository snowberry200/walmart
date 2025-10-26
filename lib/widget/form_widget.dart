import 'package:flutter/cupertino.dart';
import 'package:walmart/widget/email_text_field.dart';
import 'package:walmart/widget/sign_up_button.dart';
import 'package:walmart/widget/submit_button.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({Key? key}) : super(key: key);

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController emailController =
      TextEditingController(); // Add controller here
  bool isSignedIn = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          EmailTextField(
            controller: emailController, // Pass controller
          ),
          const SizedBox(height: 25),
          SubmitButton(
            formkey: formKey,
            emailController: emailController, // Pass the controller
          ),
          const SizedBox(height: 20),
          const Text(
            "Don't have an account?",
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          SignUpButton(),
        ],
      ),
    );
  }
}
