import 'package:dartz/dartz.dart';
import 'package:view_line/core/errors/failure.dart';
import 'package:view_line/features/auth/domain/entities/auth_entities.dart';

abstract class LoginRepository {
  Future<Either<Failure, AuthEntities>> loginUser(
    String email,
    String password,
  );
}
