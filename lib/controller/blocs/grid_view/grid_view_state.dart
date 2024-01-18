part of 'grid_view_bloc.dart';

class GridViewState {
  final bool isGrid;

  GridViewState({required this.isGrid});
}

final class GridViewInitial extends GridViewState {
  GridViewInitial() : super(isGrid: false);
}
