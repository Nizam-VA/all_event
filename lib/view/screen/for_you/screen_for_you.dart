import 'package:flutter/material.dart';

class ScreenForyou extends StatelessWidget {
  const ScreenForyou({super.key});

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
