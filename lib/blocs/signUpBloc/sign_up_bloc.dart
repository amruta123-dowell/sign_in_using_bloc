import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_sign_in/models/user_details_model.dart';
import 'package:flutter_bloc_sign_in/utils/data_base.dart';

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

      var databaseList = await database.getUserDetails();

      List<UserDetailsModel> userDataList =
          UserDetailsModel.convertToUserDetailsList(databaseList);
      var repeatedUid = userDataList
          .firstWhereOrNull((element) => element.id == event.userDetails.id);

      if (repeatedUid == null) {
        database.insertUser(event.userDetails);
        print(databaseList);
        emit(SignUpSuccess());
      } else {
        emit(const SignUpFailure(
            errorMessage:
                "The userId is Exist. Please sign in through valid user credentials"));
      }
    } catch (e) {
      print("error ---------------- $e");
      emit(SignUpFailure(errorMessage: e.toString()));
    }
  }

  FutureOr<void> resetSignUp(SignUpReset event, Emitter<SignUpState> emit) {
    emit(SignUpResetState());
  }
}
