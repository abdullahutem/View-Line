import 'package:view_line/features/about_us/models/employee_model.dart';
import 'package:view_line/features/about_us/models/partner_model.dart';

class AboutUsModel {
  final String appNameEn;
  final String appNameAr;
  final String subtitleEn;
  final String subtitleAr;
  final String descriptionEn;
  final String descriptionAr;
  final String visionEn;
  final String visionAr;
  final String messageEn;
  final String messageAr;
  final List<String> valuesEn;
  final List<String> valuesAr;
  final List<PartnerModel> partners;
  final List<EmployeeModel> employees;

  AboutUsModel({
    required this.appNameEn,
    required this.appNameAr,
    required this.subtitleEn,
    required this.subtitleAr,
    required this.descriptionEn,
    required this.descriptionAr,
    required this.visionEn,
    required this.visionAr,
    required this.messageEn,
    required this.messageAr,
    required this.valuesEn,
    required this.valuesAr,
    required this.partners,
    required this.employees,
  });
}
