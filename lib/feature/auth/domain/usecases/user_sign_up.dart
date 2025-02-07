import 'package:blog_project/core/error/failure.dart';
import 'package:blog_project/core/usecase/usecase.dart';
import 'package:blog_project/feature/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserSignUp implements UseCase<String, UserSignUpParams> {
  final AuthRepository authRepository;
  UserSignUp(this.authRepository);
  @override
  Future<Either<Failure, String>> call(UserSignUpParams params) async {
    return await authRepository.signUpWithEmailPassword(
        name: params.name, email: params.email, password: params.password);
  }
}

class UserSignUpParams {
  late String name;
  late String email;
  late String password;
  UserSignUpParams(this.name, this.email, this.password);
}
