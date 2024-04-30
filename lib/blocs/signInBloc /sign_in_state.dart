part of 'sign_in_bloc.dart';

class SignInState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignInAddState extends Equatable {
  final SignInStatus signInStatus;
  String? errorMessage;

  SignInAddState({required this.signInStatus, this.errorMessage});
  @override
  List<Object?> get props => [signInStatus, errorMessage];

  SignInAddState copyWith(
      {required SignInStatus status, String? errorMessage}) {
    return SignInAddState(signInStatus: status, errorMessage: errorMessage);
  }
}
