import 'package:flutter/material.dart';

class CustomCenterIndicator extends StatelessWidget {
  const CustomCenterIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator(),
      );

  }
}
