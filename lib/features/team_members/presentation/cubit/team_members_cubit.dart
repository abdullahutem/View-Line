import 'package:bloc/bloc.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:view_line/core/connection/network_info.dart';
import 'package:view_line/core/database/api/dio_consumer.dart';
import 'package:view_line/features/team_members/data/datasources/team_members_remote_data_source.dart';
import 'package:view_line/features/team_members/data/repository/team_members_repository_impl.dart';
import 'package:view_line/features/team_members/domain/entities/team_members_entities.dart';
import 'package:view_line/features/team_members/domain/team_memberscases/get_team_members.dart';

part 'team_members_state.dart';

class TeamMembersCubit extends Cubit<TeamMembersState> {
  TeamMembersCubit() : super(TeamMembersInitial());

  Future<void> getTeamMembers() async {
    emit(TeamMembersLoading());
    try {
      final useCase = GetTeamMember(
        sectionsRepository: TeamMembersRepositoryImpl(
          networkInfo: NetworkInfoImpl(
            connectionChecker: DataConnectionChecker(),
          ),
          teamMembersRemoteDataSource: TeamMembersRemoteDataSource(
            api: DioConsumer(dio: Dio()),
          ),
        ),
      );

      final result = await useCase();

      result.fold(
        (failure) => emit(TeamMembersError(message: failure.toString())),
        (teamMembers) => emit(TeamMembersLoaded(teamMembers: teamMembers)),
      );
    } catch (e) {
      emit(TeamMembersError(message: e.toString()));
    }
  }
}
