part of 'sign_up_bloc.dart';

class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class SignUpInitialEvent extends SignUpEvent {
  final UserDetailsModel userDetails;
  const SignUpInitialEvent({required this.userDetails});
  @override
  List<Object> get props => [userDetails];
}

class SignUpReset extends SignUpEvent {}
