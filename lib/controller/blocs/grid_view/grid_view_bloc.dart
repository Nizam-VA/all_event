import 'package:bloc/bloc.dart';

part 'grid_view_event.dart';
part 'grid_view_state.dart';

class GridViewBloc extends Bloc<GridViewEvent, GridViewState> {
  GridViewBloc() : super(GridViewInitial()) {
    on<IsGridEvent>((event, emit) {
      bool isGrid = !event.isGrid;
      print(isGrid);
      emit(GridViewState(isGrid: isGrid));
    });
  }
}
