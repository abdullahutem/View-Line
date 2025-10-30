part of 'team_members_cubit.dart';

abstract class TeamMembersState {
  const TeamMembersState();
}

final class TeamMembersInitial extends TeamMembersState {}

class TeamMembersLoading extends TeamMembersState {}

class TeamMembersLoaded extends TeamMembersState {
  final List<TeamMemberEntities> teamMembers;

  const TeamMembersLoaded({required this.teamMembers});
}

class TeamMembersError extends TeamMembersState {
  final String message;

  const TeamMembersError({required this.message});
}
