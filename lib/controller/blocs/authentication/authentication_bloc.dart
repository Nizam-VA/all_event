import 'package:all_events/controller/auth_service/auth_service.dart';
import 'package:bloc/bloc.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<GoogleSignInEvent>((event, emit) async {
      emit(AuthLoadingState());
      final response = await AuthService().signInWithGoogle();
      response.fold((error) {
        emit(AuthenticationErrorState(error: error));
      }, (success) {
        emit(AuthenticationSuccessState());
      });
    });
  }
}
