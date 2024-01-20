import 'package:all_events/view/screen/authentication/screen_authentication.dart';
import 'package:all_events/view/screen/root/screen_root.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    checkUserOnBoarding();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[50],
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
          height: 80,
        ),
      ),
    );
  }

  Future<void> checkUserOnBoarding() async {
    final preferences = await SharedPreferences.getInstance();
    final userLogin = preferences.getBool('LOGIN');
    if (userLogin == null || userLogin == false) {
      await Future.delayed(const Duration(seconds: 3));
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) => const ScreenAuthentication(),
        ),
      );
    } else {
      await Future.delayed(const Duration(seconds: 3));
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) => ScreenRoot(),
        ),
      );
    }
  }
}
