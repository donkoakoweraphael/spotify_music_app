import 'package:flutter/material.dart';

class YourLibrary extends StatelessWidget {
  const YourLibrary({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Text(
          "Your library",
          style: TextStyle(
            fontSize: 48,
            color: Colors.yellow,
          ),
        ),
      ),
    );
  }
}
