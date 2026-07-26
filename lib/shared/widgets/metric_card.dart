import 'package:flutter/material.dart';

import '../../app/theme.dart';
import 'milaak_ui.dart';

class MetricCard extends StatelessWidget {
  const MetricCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    this.description,
    this.color,
  });

  final String title;
  final String value;
  final IconData icon;
  final String? description;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final effectiveColor = color ?? MilaakColors.primary;
    return MilaakStatCard(
      title: title,
      value: value,
      icon: icon,
      color: effectiveColor,
      subtitle: description,
    );
  }
}
