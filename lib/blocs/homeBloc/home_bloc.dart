import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_sign_in/models/user_details_model.dart';

import '../../utils/data_base.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<InitialHomeEvent>((event, emit) async {
      DatabaseHelper databaseHelper = DatabaseHelper();
      UserDetailsModel? userDetails =
          await databaseHelper.getUserData(event.userId);
      if (userDetails != null) {
        HomeInitial(userDetails: userDetails);
      }
    });
  }
}
