import 'package:flutter/material.dart';

class AllCommentsText extends StatelessWidget {
  const AllCommentsText({super.key, required this.quantityOfComments});

  final int quantityOfComments;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Text(
        'See all the $quantityOfComments comments',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
    );
  }
}
