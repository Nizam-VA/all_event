import 'package:all_events/utils/constants.dart';
import 'package:flutter/material.dart';

class ScreenForyou extends StatelessWidget {
  const ScreenForyou({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[50],
      appBar: AppBar(
        title: const Text('For You'),
        centerTitle: true,
        elevation: 0,
        toolbarHeight: Constants.height * .1,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(Constants.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      body: Center(
        child: Image.asset(
          'assets/images/empty.png',
          height: 100,
        ),
      ),
    );
  }
}
