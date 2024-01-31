import 'package:flutter/material.dart';

class CustomNoDataAvailable extends StatelessWidget {
  const CustomNoDataAvailable({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "No Data Available",
      ),
    );
  }
}
