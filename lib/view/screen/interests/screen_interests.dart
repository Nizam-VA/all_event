import 'package:flutter/material.dart';

class ScreenInterests extends StatelessWidget {
  const ScreenInterests({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[50],
      body: Center(
        child: Image.asset(
          'assets/images/empty.png',
          height: 100,
        ),
      ),
    );
  }
}
