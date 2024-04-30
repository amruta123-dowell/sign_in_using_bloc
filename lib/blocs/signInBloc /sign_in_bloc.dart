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
    on<InitialSignIn>(onClickSignInButton);
 
  }

  FutureOr<void> onClickSignInButton(
      InitialSignIn event, Emitter<SignInAddState> emit) async {
    emit(state.copyWith(status: SignInStatus.initial));
    if (event.password.isEmpty || event.userId.toString().isEmpty) {
      emit(state.copyWith(status: SignInStatus.failure, errorMessage: "UserId or password arePlease fill userId and password."));
      return;
    }
    DatabaseHelper databaseHelper = DatabaseHelper();
    List<Map<String, dynamic>> dataList = await databaseHelper.getUserDetails();
    List<UserDetailsModel> userDetailsList =
        UserDetailsModel.convertToUserDetailsList(dataList);
    UserDetailsModel? existUser = userDetailsList
        .firstWhereOrNull((element) => element.id == event.userId);
    if (existUser != null && existUser.password == event.password) {
      emit(state.copyWith(status: SignInStatus.success));
    } else if (existUser != null && existUser.password != event.password) {
      emit(state.copyWith(
          status: SignInStatus.failure,
          errorMessage: "Please check with password.Password is wrong"));
    } else {
      emit(
        state.copyWith(
            status: SignInStatus.create,
            errorMessage: "User is not exist, Please create new account"),
      );
    }
  }


}
