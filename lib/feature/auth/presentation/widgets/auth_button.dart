import 'package:blog_project/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AuthGradientButton extends StatelessWidget {
  final String title;
  final VoidCallback onpressed;
  const AuthGradientButton(
      {super.key, required this.title, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
          onPressed: onpressed,
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
            backgroundColor: AppPallete.gradient1,
          ),
          child: Text(
            title,
            style: TextStyle(
                color: AppPallete.whiteColor, fontWeight: FontWeight.w600),
          )),
    );
  }
}
