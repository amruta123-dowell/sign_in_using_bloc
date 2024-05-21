part of 'sign_in_bloc.dart';

class SignInState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignInAddState extends Equatable {
  final SignInStatus signInStatus;
  String? errorMessage;
  int? userId;

  SignInAddState({required this.signInStatus, this.errorMessage, this.userId});
  @override
  List<Object?> get props => [signInStatus, errorMessage];

  SignInAddState copyWith(
      {required SignInStatus status, String? errorMessage, int? userId}) {
    return SignInAddState(signInStatus: status, errorMessage: errorMessage, userId: userId);
  }
}
