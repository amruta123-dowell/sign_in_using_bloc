import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_bloc_sign_in/models/user_details_model.dart';

import '../../enumaration/sign_in_status_enum.dart';
import '../../utils/data_base.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInAddState> {
  SignInBloc() : super(SignInAddState(signInStatus: SignInStatus.success)) {
    on<InitialSignInEvent>(onClickSignInButton);
    on<ClearErrorEvent>(onClearError);
  }

  FutureOr<void> onClickSignInButton(
      InitialSignInEvent event, Emitter<SignInAddState> emit) async {
    emit(state.copyWith(status: SignInStatus.initial));
    if (event.password.isEmpty || event.userId.toString().isEmpty) {
      emit(state.copyWith(
          status: SignInStatus.failure,
          errorMessage:
              "UserId or password are empty, Please fill userId and password."));
      return;
    }
    DatabaseHelper databaseHelper = DatabaseHelper();

    UserDetailsModel? existUser =
        await databaseHelper.getUserData(event.userId);
    print(existUser);
    if (existUser != null &&
        existUser.password == event.password &&
        existUser.id == event.userId) {
      print(existUser);
      emit(state.copyWith(status: SignInStatus.success, userId: event.userId));
    } else if (existUser != null && existUser.password != event.password ||
        existUser?.id != event.userId) {
      emit(state.copyWith(
          status: SignInStatus.failure,
          errorMessage:
              "Password or UserId is wrong. Please check with password."));
    } else {
      emit(
        state.copyWith(
            status: SignInStatus.create,
            errorMessage: "User is not exist, Please create new account"),
      );
    }
  }

  FutureOr<void> onClearError(
      ClearErrorEvent event, Emitter<SignInAddState> emit) {
    emit(state.copyWith(status: SignInStatus.initial, errorMessage: null));
  }
}
