import 'package:bloc/bloc.dart';

part 'root_event.dart';
part 'root_state.dart';

class RootBloc extends Bloc<RootEvent, RootState> {
  RootBloc() : super(RootInitial()) {
    on<IndexChangerEvent>((event, emit) {
      emit(RootState(index: event.index));
    });
  }
}
