part of 'root_bloc.dart';

class RootEvent {}

class IndexChangerEvent extends RootEvent {
  final int index;
  IndexChangerEvent({required this.index});
}
