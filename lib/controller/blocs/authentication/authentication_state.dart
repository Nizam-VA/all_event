part of 'authentication_bloc.dart';

class AuthenticationState {}

final class AuthenticationInitial extends AuthenticationState {}

class AuthenticationErrorState extends AuthenticationState {
  final String error;
  AuthenticationErrorState({required this.error});
}

class AuthenticationSuccessState extends AuthenticationState {}

class AuthLoadingState extends AuthenticationState {}
