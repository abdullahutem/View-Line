import 'package:flutter/material.dart';

class MainService {
  final String id;
  final String titleEn;
  final String titleAr;
  final String subtitleEn;
  final String subtitleAr;
  final String imageUrl;
  final IconData icon;
  final String descriptionEn;
  final String descriptionAr;
  final String overviewEn;
  final String overviewAr;
  final List<String> requirementsEn;
  final List<String> requirementsAr;
  final String costInformationEn;
  final String costInformationAr;
  final List<ServicePackage> packages;
  final String contactInstructionsEn;
  final String contactInstructionsAr;

  MainService({
    required this.id,
    required this.titleEn,
    required this.titleAr,
    required this.subtitleEn,
    required this.subtitleAr,
    required this.imageUrl,
    required this.icon,
    required this.descriptionEn,
    required this.descriptionAr,
    required this.overviewEn,
    required this.overviewAr,
    required this.requirementsEn,
    required this.requirementsAr,
    required this.costInformationEn,
    required this.costInformationAr,
    required this.packages,
    required this.contactInstructionsEn,
    required this.contactInstructionsAr,
  });
}

class ServicePackage {
  final String nameEn;
  final String nameAr;
  final String descriptionEn;
  final String descriptionAr;
  final String price;
  final List<String> featuresEn;
  final List<String> featuresAr;

  const ServicePackage({
    required this.nameEn,
    required this.nameAr,
    required this.descriptionEn,
    required this.descriptionAr,
    required this.price,
    required this.featuresEn,
    required this.featuresAr,
  });
}
