import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sign_in_status_event.dart';
part 'sign_in_status_state.dart';

class SignInStatusBloc extends Bloc<SignInStatusEvent, SignInStatusState> {
  SignInStatusBloc() : super(SignInStatusState()) {
    on<SignInStatusEvent>((event, emit) {});
  }
}
