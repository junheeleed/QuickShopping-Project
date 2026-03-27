import 'package:flutter/material.dart';
import '../theme/theme_x.dart';

class RatingBadge extends StatelessWidget {
  final double rating;
  final int count;

  const RatingBadge({super.key, required this.rating, required this.count});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final spacing = context.spacing;

    return Row(
      children: [
        Icon(Icons.star, size: 18, color: colors.textPrimary),
        const SizedBox(width: 4),
        Text(
          rating.toStringAsFixed(1),
          style: context.text.bodySmall?.copyWith(
            fontWeight: FontWeight.w800,
            color: colors.textPrimary,
          ),
        ),
        SizedBox(width: spacing.itemGap),
        Text(
          '($count)',
          style: context.text.bodySmall?.copyWith(
            fontWeight: FontWeight.w700,
            color: colors.textSecondary,
          ),
        ),
      ],
    );
  }
}