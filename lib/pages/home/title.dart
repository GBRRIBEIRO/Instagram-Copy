import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Instagram',
      style: TextStyle(
          fontFamily: 'Instagram Sans',
          fontWeight: FontWeight.bold,
          fontSize: 25),
    );
  }
}
