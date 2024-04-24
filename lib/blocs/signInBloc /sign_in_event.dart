part of 'sign_in_bloc.dart';

class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class InitialSignIn extends SignInEvent {
  final int userId;
  final String password;
  const InitialSignIn({required this.userId, required this.password});

  @override
  List<Object> get props => [userId, password];
}


