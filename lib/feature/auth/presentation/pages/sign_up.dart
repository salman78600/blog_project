import 'package:blog_project/core/theme/app_pallete.dart';
import 'package:blog_project/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:blog_project/feature/auth/presentation/widgets/auth_button.dart';
import 'package:blog_project/feature/auth/presentation/widgets/auth_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
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
              "Sign Up",
              style: TextStyle(
                  fontSize: 24,
                  color: AppPallete.whiteColor,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              "Please fill all the fields to register your account.",
              style: TextStyle(fontSize: 12, color: AppPallete.greyColor),
            ),
            SizedBox(
              height: 10,
            ),
            AuthField(
              hintText: 'Name',
              controller: nameController,
            ),
            SizedBox(
              height: 15,
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
              title: 'Sign Up',
              onpressed: () {
                // ignore: avoid_print
                print(nameController.text);
                if (formKey.currentState!.validate()) {
                  context.read<AuthBloc>().add(AuthSignUp(
                      name: nameController.text,
                      email: emailController.text.trim(),
                      password: passwordController.text.trim()));
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: 'Already have an account?',
                    style: Theme.of(context).textTheme.titleMedium!,
                    children: [
                      TextSpan(
                          text: " Sign in",
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
