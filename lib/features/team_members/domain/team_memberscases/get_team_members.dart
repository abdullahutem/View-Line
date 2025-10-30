import 'package:dartz/dartz.dart';
import 'package:view_line/core/errors/failure.dart';
import 'package:view_line/features/team_members/domain/entities/team_members_entities.dart';
import 'package:view_line/features/team_members/domain/repositories/partners_repository.dart';

class GetTeamMember {
  final TeamMembersRepository sectionsRepository;

  GetTeamMember({required this.sectionsRepository});

  Future<Either<Failure, List<TeamMemberEntities>>> call() {
    return sectionsRepository.getAllTeamMembers();
  }
}
