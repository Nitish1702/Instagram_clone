import 'package:flutter/material.dart';
import 'package:instagram_clone/colors.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final String hintText;
  final bool isPass;

  const TextFieldInput({Key? key, required this.controller, required this.hintText, this.isPass=false,required this.textInputType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder= OutlineInputBorder(
      borderSide: Divider.createBorderSide(context),
    );
    return TextField(
      controller:controller,
      decoration: InputDecoration(
        hintText:hintText,
        border:inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        contentPadding: const EdgeInsets.all(8),
      ),
      keyboardType: textInputType,
      obscureText: isPass,
    );
  }
}
