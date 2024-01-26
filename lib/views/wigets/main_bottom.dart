import 'package:flutter/material.dart';

class MainBottom extends StatelessWidget {
  const MainBottom({super.key, required this.text, required this.onTap});

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
        ),
        child: Text(
          text,
        ),
      ),
    );
  }
}
