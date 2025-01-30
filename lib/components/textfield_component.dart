import 'package:flutter/material.dart';

class InfoTextfomField extends StatelessWidget {
  final String labelText;
  final FocusNode focusNode = FocusNode();
  late final TextEditingController fieldController;
  final TextInputType keyboardtype;
  final void Function(String?) onChanged;
  String? Function(String?) validator;

  final Widget? suffixicon;

  InfoTextfomField(
      {super.key,
      required this.labelText,
      required this.fieldController,
      required this.keyboardtype,
      required this.onChanged,
      required this.validator,
      this.suffixicon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: TextFormField(
    
        focusNode: focusNode,
        validator: validator,
        onChanged: onChanged,
        controller: fieldController,
        keyboardType: keyboardtype,
        cursorColor: Colors.blue,
        cursorWidth: 1,
        decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            helperText: " ",
            labelText: labelText,
            labelStyle:
                const TextStyle(color: Color.fromARGB(255, 91, 90, 101)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: const BorderSide(
                    color: Color.fromARGB(255, 181, 180, 192))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: const BorderSide(color: Colors.blue)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: const BorderSide(color: Colors.red)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: const BorderSide(color: Colors.red, width: 2)),
            suffixIcon: suffixicon),
      ),
    );
  }
}
