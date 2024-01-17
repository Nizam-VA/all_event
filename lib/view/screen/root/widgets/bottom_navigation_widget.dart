import 'package:all_events/controller/blocs/root/root_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RootBloc, RootState>(
      builder: (context, state) {
        return BottomNavigationBar(
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.black,
            type: BottomNavigationBarType.fixed,
            currentIndex: state.index,
            onTap: (value) {
              context.read<RootBloc>().add(IndexChangerEvent(index: value));
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.format_overline_sharp), label: 'For you'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.star_border), label: 'Interests'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_outlined), label: 'Profile'),
            ]);
      },
    );
  }
}
