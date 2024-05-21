part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class InitialHomeEvent extends HomeEvent {
  final int userId;
  const InitialHomeEvent({required this.userId});
  @override
  List<Object> get props => [userId];
}
