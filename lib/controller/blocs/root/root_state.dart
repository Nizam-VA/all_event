part of 'root_bloc.dart';

class RootState {
  final int index;

  RootState({required this.index});
}

final class RootInitial extends RootState {
  RootInitial({super.index = 0});
}
