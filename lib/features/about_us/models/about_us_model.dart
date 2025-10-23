import 'package:view_line/features/about_us/models/employee_model.dart';
import 'package:view_line/features/about_us/models/partner_model.dart';

class AboutUsModel {
  final String appName;
  final String subtitle;
  final String description;
  final String vision;
  final String message;
  final List<String> values;
  final List<PartnerModel> partners;
  final List<EmployeeModel> employees;

  AboutUsModel({
    required this.appName,
    required this.subtitle,
    required this.description,
    required this.vision,
    required this.message,
    required this.values,
    required this.partners,
    required this.employees,
  });
}

// class AboutUsModel {
//   final String appName;
//   final String subtitle;
//   final String description;
//   final String vision;
//   final String message;
//   final List<String> values;
//   final List<Partner> partners;
//   final List<TeamMember> team;

//   AboutUsModel({
//     required this.appName,
//     required this.subtitle,
//     required this.description,
//     required this.vision,
//     required this.message,
//     required this.values,
//     required this.partners,
//     required this.team,
//   });
// }
