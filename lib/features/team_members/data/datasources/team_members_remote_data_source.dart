import 'package:view_line/core/database/api/api_consumer.dart';
import 'package:view_line/core/database/api/end_points.dart';
import 'package:view_line/features/team_members/data/models/team_members_model.dart';

class TeamMembersRemoteDataSource {
  final ApiConsumer api;

  TeamMembersRemoteDataSource({required this.api});
  Future<List<TeamMemberModel>> getTeamMembersSections() async {
    final response = await api.get("${EndPoints.teamMembers}");
    return TeamMemberModel.listFromJson(response);
  }
}
