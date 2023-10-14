part of 'details_cubit.dart';

class DetailsState extends Equatable {
  const DetailsState();
  @override
  List<Object> get props => [];
}

class DetailsInitial extends DetailsState {}

class DetailsFetchLoading extends DetailsState {}

class DetailsFetchSuccess extends DetailsState {
  Details data;
  DetailsFetchSuccess(this.data);
  @override
  List<Object> get props => [data];
}

class DetailsFetchFailure extends DetailsState {
  final String error;
  const DetailsFetchFailure(this.error);
  @override
  List<Object> get props => [error];
}
