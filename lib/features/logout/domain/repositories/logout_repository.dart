import 'package:dartz/dartz.dart';
import 'package:view_line/core/errors/failure.dart';
import 'package:view_line/features/logout/data/model/logout_model.dart';

abstract class LogoutRepository {
  Future<Either<Failure, LogoutModel>> getAllLogout();
}
