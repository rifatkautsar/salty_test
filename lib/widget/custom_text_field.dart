import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final String? Function(String?)? validator;

  const CustomTextField(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.obscureText,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.09,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          border: const OutlineInputBorder(),
        ),
        validator: validator,
      ),
    );
  }
}
