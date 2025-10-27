import 'package:flutter/material.dart';

class Achievement {
  final String id;
  final IconData icon;
  final int number;
  final String labelEn;
  final String labelAr;

  final String suffix;
  final Color color;

  const Achievement({
    required this.id,
    required this.icon,
    required this.number,
    required this.labelEn,
    required this.labelAr,
    this.suffix = '+',
    required this.color,
  });
}
