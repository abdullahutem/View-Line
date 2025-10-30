import 'package:dartz/dartz.dart';
import 'package:view_line/core/errors/failure.dart';
import 'package:view_line/features/auth/domain/entities/auth_entities.dart';
import 'package:view_line/features/auth/domain/repository/login_repository.dart';

class LoginUser {
  final LoginRepository loginRepository;

  LoginUser({required this.loginRepository});

  Future<Either<Failure, AuthEntities>> call(String email, String password) {
    return loginRepository.loginUser(email, password);
  }
}
