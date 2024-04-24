part of 'sign_up_bloc.dart';

class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

final class SignUpInitial extends SignUpState {}

final class ButtonClickedState extends SignUpState {}

final class SignUpSuccess extends SignUpState {}

final class SignUpFailure extends SignUpState {
  final String errorMessage;

  const SignUpFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

final class SignUpResetState extends SignUpState {}
