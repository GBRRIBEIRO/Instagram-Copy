import 'package:flutter/material.dart';

import '../../../models/user_base.dart';

class LikedByText extends StatelessWidget {
  const LikedByText({super.key, required this.likedBy});

  final int likedBy;

  @override
  Widget build(BuildContext context) {
    return likedBy == 0
        ? const Text(
            'No likes.',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          )
        : Text(
            'Liked by $likedBy people.',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          );
  }
}
