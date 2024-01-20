part of 'profile_bloc.dart';

class ProfileState {
  final String name;
  final String imageUrl;
  ProfileState({required this.name, required this.imageUrl});
}

final class ProfileInitial extends ProfileState {
  ProfileInitial() : super(name: '', imageUrl: '');
}

class ProfileLoadingState extends ProfileState {
  ProfileLoadingState({required super.name, required super.imageUrl});
}
