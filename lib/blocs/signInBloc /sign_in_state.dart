part of 'sign_in_bloc.dart';

class SignInState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignInAddState extends Equatable {
  final SignInStatus signInStatus;
  final String? errorMessage;

  const SignInAddState({required this.signInStatus, this.errorMessage});
  @override
  List<Object> get props => [signInStatus];

  SignInAddState copyWith(
      {required SignInStatus status, String? errorMessage}) {
    return SignInAddState(signInStatus: status, errorMessage: errorMessage);
  }
}

class OnClickSignInButtonState extends SignInState {}
