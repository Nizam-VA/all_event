import 'package:all_events/controller/auth_service/auth_service.dart';
import 'package:bloc/bloc.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<GetProfileEvent>((event, emit) async {
      emit(ProfileLoadingState(name: 'name', imageUrl: 'imageUrl'));
      final response = await AuthService().signInWithGoogle();
      response.fold((error) {
        emit(ProfileState(name: '', imageUrl: ''));
      }, (success) {
        emit(ProfileState(
            name: success.user!.displayName!,
            imageUrl: success.user!.photoURL!));
      });
    });
  }
}
