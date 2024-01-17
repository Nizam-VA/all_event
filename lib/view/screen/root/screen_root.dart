import 'package:all_events/controller/blocs/root/root_bloc.dart';
import 'package:all_events/view/screen/for_you/screen_for_you.dart';
import 'package:all_events/view/screen/home/screen_home.dart';
import 'package:all_events/view/screen/interests/screen_interests.dart';
import 'package:all_events/view/screen/profile/screen_profile.dart';
import 'package:all_events/view/screen/root/widgets/bottom_navigation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenRoot extends StatelessWidget {
  ScreenRoot({super.key});
  final screens = [
    const ScreenHome(),
    const ScreenForyou(),
    const ScreenInterests(),
    ScreenProfile()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RootBloc, RootState>(
        builder: (context, state) {
          return screens[state.index];
        },
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
