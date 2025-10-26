import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NameTextField extends StatefulWidget {
  const NameTextField({Key? key}) : super(key: key);

  @override
  State<NameTextField> createState() => NameTextFieldState();
}

class NameTextFieldState extends State<NameTextField> {
  final TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        selectionControls: CupertinoDesktopTextSelectionControls(),
        cursorColor: Colors.blue,
        enableIMEPersonalizedLearning: true,
        textCapitalization: TextCapitalization.values[0],
        enableInteractiveSelection: true,
        autofillHints: const [AutofillHints.email],
        controller: name,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.emailAddress,
        onSaved: (value) => name.text = value!,
        decoration: const InputDecoration(
            focusedBorder: OutlineInputBorder(),
            focusColor: CupertinoColors.black,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            labelText: 'name',
            contentPadding: EdgeInsets.all(10)),
        validator: (value) => value!.isEmpty ? 'Enter your name' : null);
  }
}
