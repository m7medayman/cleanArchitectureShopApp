part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeDataLoaded extends HomeState {
  List<ServicesBanner> services;
  HomeDataLoaded(this.services);
}

class HomeError extends HomeState {
  String error;
  HomeError(this.error);
  @override
  List<Object> get props => [];
}
