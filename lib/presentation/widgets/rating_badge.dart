import 'package:flutter/material.dart';

class RatingBadge extends StatelessWidget {
  final double rating;
  final int count;

  const RatingBadge({super.key, required this.rating, required this.count});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.star, size: 16),
        const SizedBox(width: 4),
        Text(rating.toStringAsFixed(1)),
        const SizedBox(width: 6),
        Text('($count)', style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}
