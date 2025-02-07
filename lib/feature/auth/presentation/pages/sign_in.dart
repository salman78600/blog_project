import 'package:blog_project/core/theme/app_pallete.dart';
import 'package:blog_project/feature/auth/presentation/widgets/auth_button.dart';
import 'package:blog_project/feature/auth/presentation/widgets/auth_fields.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sign In",
              style: TextStyle(
                  fontSize: 24,
                  color: AppPallete.whiteColor,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              "Please fill all the fields to sign in your account.",
              style: TextStyle(fontSize: 12, color: AppPallete.greyColor),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            AuthField(
              hintText: 'Email',
              controller: emailController,
            ),
            SizedBox(
              height: 15,
            ),
            AuthField(
              hintText: 'Password',
              controller: passwordController,
              obscureText: true,
            ),
            SizedBox(
              height: 30,
            ),
            AuthGradientButton(
              title: 'Sign in',
              onpressed: () {
                // ignore: avoid_print
                print(emailController.text);
              },
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: "Don't have an account?",
                    style: Theme.of(context).textTheme.titleMedium!,
                    children: [
                      TextSpan(
                          text: " Sign up",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: AppPallete.gradient1))
                    ]),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
