import 'package:blog_project/core/secrets/app_secrets.dart';
import 'package:blog_project/core/theme/theme.dart';
import 'package:blog_project/feature/auth/data/datasources/auth_remote_data_source.dart';
import 'package:blog_project/feature/auth/data/repositories/auth_repository_impl.dart';
import 'package:blog_project/feature/auth/domain/usecases/user_sign_up.dart';
import 'package:blog_project/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:blog_project/feature/auth/presentation/pages/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final supabase = await Supabase.initialize(
      url: AppSecrets.supabaseUrl, anonKey: AppSecrets.supabaseAnnonKey);
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
          create: (context) => AuthBloc(
              signUp: UserSignUp(AuthRepositoryImpl(
                  AuthRemoteDataSourceImpl(supabase.client)))))
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Blog App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.apptheme,
        home: SignUpPage());
  }
}
