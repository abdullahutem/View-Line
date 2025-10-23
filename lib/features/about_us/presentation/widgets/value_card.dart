import 'package:flutter/material.dart';
import 'package:view_line/core/constants/app_colors.dart';

class ValueCard extends StatelessWidget {
  final String value;
  final int index;

  const ValueCard({super.key, required this.value, required this.index});

  @override
  Widget build(BuildContext context) {
    final colors = [
      AppColors.primary,
      AppColors.secondary,
      AppColors.success,
      const Color(0xFFEF4444),
      const Color(0xFF8B5CF6),
      const Color(0xFF06B6D4),
    ];

    final color = colors[index % colors.length];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3), width: 1.5),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            child: Icon(_getIconForValue(index), color: Colors.white, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }

  IconData _getIconForValue(int index) {
    final icons = [
      Icons.star,
      Icons.handshake,
      Icons.explore,
      Icons.security,
      Icons.lightbulb,
      Icons.eco,
    ];
    return icons[index % icons.length];
  }
}
