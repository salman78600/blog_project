import 'package:blog_project/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static _border([Color color = AppPallete.borderColor]) => OutlineInputBorder(
      borderSide: BorderSide(
        color: AppPallete.borderColor,
        width: 3,
      ),
      borderRadius: BorderRadius.circular(7));
  static final apptheme = ThemeData.dark().copyWith(
      scaffoldBackgroundColor: AppPallete.backgroundColor,
      inputDecorationTheme: InputDecorationTheme(
          contentPadding: EdgeInsets.all(20),
          enabledBorder: _border(),
          focusedBorder: _border(AppPallete.gradient2)));
}
