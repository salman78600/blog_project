import 'package:blog_project/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AuthField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  const AuthField(
      {super.key,
      required this.hintText,
      required this.controller,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return "$value is empty";
        }
        return null;
      },
      obscureText: obscureText,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: AppPallete.greyColor)),
    );
  }
}
