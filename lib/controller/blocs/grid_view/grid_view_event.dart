part of 'grid_view_bloc.dart';

class GridViewEvent {}

class IsGridEvent extends GridViewEvent {
  final bool isGrid;
  IsGridEvent({required this.isGrid});
}
