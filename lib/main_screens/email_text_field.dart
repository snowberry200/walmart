import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    Key? key,
    required TextEditingController email,
  })  : _email = email,
        super(key: key);

  final TextEditingController _email;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        selectionControls: CupertinoDesktopTextSelectionControls(),
        // mouseCursor: MouseCursor.uncontrolled,
        // clipBehavior: Clip.antiAlias,
        cursorColor: Colors.blue,
        enableIMEPersonalizedLearning: true,
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
            labelText: 'Email Address',
            contentPadding: EdgeInsets.all(10)),
        validator: (ifemail) =>
            !EmailValidator.validate(ifemail!) ? 'Enter a valid email' : null);
  }
}
