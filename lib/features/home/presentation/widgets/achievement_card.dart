import 'package:flutter/material.dart';
import 'package:view_line/core/constants/app_colors.dart';
import 'package:view_line/features/home/domain/entities/sub_enities/feature_entities.dart';
import 'package:view_line/features/home/presentation/widgets/animated_counter.dart';

class AchievementCard extends StatefulWidget {
  final StatEntities stat;
  final int index;
  final bool isArabic;

  const AchievementCard({
    Key? key,
    required this.stat,
    required this.index,
    required this.isArabic,
  }) : super(key: key);

  @override
  State<AchievementCard> createState() => _AchievementCardState();
}

class _AchievementCardState extends State<AchievementCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  // Map icon names to IconData
  IconData _getIconData(String? iconName) {
    switch (iconName) {
      case 'UsersIcon':
        return Icons.people;
      case 'GlobeIcon':
        return Icons.public;
      case 'StarIcon':
        return Icons.star;
      case 'TrophyIcon':
        return Icons.emoji_events;
      default:
        return Icons.analytics;
    }
  }

  // Get color based on index
  Color _getColor() {
    final colors = [
      AppColors.primary,
      AppColors.secondary,
      const Color(0xFF00BCD4), // Cyan
      const Color(0xFF4CAF50), // Green
    ];
    return colors[widget.index % colors.length];
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    // Stagger animation based on index
    Future.delayed(Duration(milliseconds: widget.index * 50), () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = _getColor();
    final label = widget.isArabic ? widget.stat.labelAr : widget.stat.labelEn;

    return FadeTransition(
      opacity: _fadeAnimation,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: color.withOpacity(0.2), width: 2),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon with gradient background
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [color, color.withOpacity(0.7)],
                  ),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: color.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Icon(
                  _getIconData(widget.stat.icon),
                  size: 32,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 16),

              // Animated Counter
              AnimatedCounter(
                end: int.tryParse(widget.stat.number ?? '0') ?? 0,
                suffix: widget.stat.suffix ?? '',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
                duration: Duration(seconds: 5),
              ),

              const SizedBox(height: 8),

              // Label
              Text(
                label ?? '',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
