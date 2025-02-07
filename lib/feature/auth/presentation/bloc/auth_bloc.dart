import 'package:blog_project/feature/auth/domain/usecases/user_sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp userSignUp;
  AuthBloc({
    required UserSignUp signUp,
  })  : userSignUp = signUp,
        super(AuthInitial()) {
    on<AuthSignUp>((event, emit) async {
      final result = await userSignUp(
          UserSignUpParams(event.name, event.email, event.password));
      result.fold((failure) => emit(AuthFailure(failure.message)),
          (uid) => emit(AuthSuccess(uid)));
    });
  }
}
