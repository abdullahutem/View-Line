import 'package:dartz/dartz.dart';
import 'package:view_line/core/connection/network_info.dart';
import 'package:view_line/core/errors/expentions.dart';
import 'package:view_line/core/errors/failure.dart';
import 'package:view_line/features/team_members/data/datasources/team_members_remote_data_source.dart';
import 'package:view_line/features/team_members/domain/entities/team_members_entities.dart';
import 'package:view_line/features/team_members/domain/repositories/partners_repository.dart';

class TeamMembersRepositoryImpl extends TeamMembersRepository {
  final NetworkInfo networkInfo;
  final TeamMembersRemoteDataSource teamMembersRemoteDataSource;
  TeamMembersRepositoryImpl({
    required this.networkInfo,
    required this.teamMembersRemoteDataSource,
  });
  @override
  Future<Either<Failure, List<TeamMemberEntities>>> getAllTeamMembers() async {
    if (await networkInfo.isConnected!) {
      try {
        final response = await teamMembersRemoteDataSource
            .getTeamMembersSections();
        return Right(response);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      return Left(Failure(errMessage: "No internet connection"));
    }
  }
}
