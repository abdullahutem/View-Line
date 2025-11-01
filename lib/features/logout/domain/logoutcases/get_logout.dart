import 'package:dartz/dartz.dart';
import 'package:view_line/core/errors/failure.dart';
import 'package:view_line/features/Logout/domain/repositories/Logout_repository.dart';
import 'package:view_line/features/logout/data/model/logout_model.dart';

class GetLogout {
  final LogoutRepository logoutRepository;

  GetLogout({required this.logoutRepository});

  Future<Either<Failure, LogoutModel>> call() {
    return logoutRepository.getAllLogout();
  }
}
