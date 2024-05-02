part of 'sign_in_bloc.dart';

class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class InitialSignInEvent extends SignInEvent {
  final int userId;
  final String password;
  const InitialSignInEvent({required this.userId, required this.password});

  @override
  List<Object> get props => [userId, password];
}

class ClearErrorEvent extends SignInEvent {}
