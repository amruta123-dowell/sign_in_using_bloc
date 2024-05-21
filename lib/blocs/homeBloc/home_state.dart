part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {
  final UserDetailsModel userDetails;
  const HomeInitial({required this.userDetails});
  @override
  List<Object> get props => [userDetails];
  HomeInitial copyWith({required UserDetailsModel userData}) {
    return HomeInitial(userDetails: userDetails);
  }
}
