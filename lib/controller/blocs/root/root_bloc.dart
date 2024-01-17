import 'package:all_events/view/screen/for_you/screen_for_you.dart';
import 'package:all_events/view/screen/home/screen_home.dart';
import 'package:all_events/view/screen/interests/screen_interests.dart';
import 'package:all_events/view/screen/profile/screen_profile.dart';
import 'package:bloc/bloc.dart';

part 'root_event.dart';
part 'root_state.dart';

class RootBloc extends Bloc<RootEvent, RootState> {
  final screens = [
    const ScreenHome(),
    const ScreenForyou(),
    const ScreenInterests(),
    const ScreenProfile()
  ];
  RootBloc() : super(RootInitial()) {
    on<IndexChangerEvent>((event, emit) {
      RootState(index: event.index);
    });
  }
}
