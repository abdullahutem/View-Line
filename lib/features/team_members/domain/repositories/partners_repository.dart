import 'package:dartz/dartz.dart';
import 'package:view_line/core/errors/failure.dart';
import 'package:view_line/features/team_members/domain/entities/team_members_entities.dart';

abstract class TeamMembersRepository {
  Future<Either<Failure, List<TeamMemberEntities>>> getAllTeamMembers();
}
