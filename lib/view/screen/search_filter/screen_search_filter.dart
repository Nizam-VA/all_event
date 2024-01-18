import 'package:all_events/utils/constants.dart';
import 'package:flutter/material.dart';

class ScreenSearchFilter extends StatelessWidget {
  const ScreenSearchFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(Constants.imageUrl), fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
