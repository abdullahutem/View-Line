import 'package:flutter/material.dart';

class MainService {
  final String id;
  final String title;
  final String subtitle;
  final String imageUrl;
  final String description;
  final String overview;
  final List<String> requirements;
  final String costInformation;
  final List<ServicePackage> packages;
  final String contactInstructions;
  final IconData icon;

  const MainService({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.description,
    required this.overview,
    required this.requirements,
    required this.costInformation,
    required this.packages,
    required this.contactInstructions,
    required this.icon,
  });
}

class ServicePackage {
  final String name;
  final String description;
  final String price;
  final List<String> features;

  const ServicePackage({
    required this.name,
    required this.description,
    required this.price,
    required this.features,
  });
}
