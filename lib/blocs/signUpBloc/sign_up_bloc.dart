import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_sign_in/models/user_details_model.dart';
import 'package:flutter_bloc_sign_in/utils/data_base.dart';
import 'package:flutter_bloc_sign_in/utils/validataors.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpInitialEvent>(addUserData);
    on<SignUpReset>(resetSignUp);
  }

  FutureOr<void> addUserData(
      SignUpInitialEvent event, Emitter<SignUpState> emit) async {
    emit(ButtonClickedState());
    try {
      DatabaseHelper database = DatabaseHelper();

      //if textfield is empty,
      if (event.userDetails.email.isEmpty ||
          event.userDetails.password.isEmpty ||
          event.userDetails.id == -1) {
        emit(const SignUpFailure(
            errorMessage: "Invalid input, Please proper details."));
        return;
      }

      var repeatedUid = await database.getUserData(event.userDetails.id);

      if (repeatedUid == null) {
        database.insertUser(event.userDetails);

        emit(SignUpSuccess());
      } else if (Validators.validateEmail(event.userDetails.email) != null &&
          Validators.validateEmail(event.userDetails.email)!.isNotEmpty) {
        emit(SignUpFailure(
            errorMessage: Validators.validateEmail(event.userDetails.email)!));
      } else if (Validators.validatePassword(event.userDetails.password) !=
              null &&
          Validators.validatePassword(event.userDetails.password)!.isNotEmpty) {
        emit(SignUpFailure(
            errorMessage:
                Validators.validatePassword(event.userDetails.password)!));
      } else {
        emit(const SignUpFailure(
            errorMessage:
                "The userId is Exist. Please sign in through valid user credentials"));
      }
    } catch (e) {
      emit(SignUpFailure(errorMessage: e.toString()));
    }
  }

  FutureOr<void> resetSignUp(SignUpReset event, Emitter<SignUpState> emit) {
    emit(SignUpResetState());
  }
}
