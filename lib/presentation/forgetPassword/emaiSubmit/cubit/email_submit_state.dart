part of 'email_submit_cubit.dart';

class EmailSubmitState extends Equatable {
  const EmailSubmitState();

  @override
  List<Object> get props => [];
}

class EmailSubmitInitial extends EmailSubmitState {
  const EmailSubmitInitial();
}

class EmailLoading extends EmailSubmitState {}

class EmailError extends EmailSubmitState {
  final String error;
  const EmailError(this.error);
  @override
  List<Object> get props => [error];
}

class EmailSuccess extends EmailSubmitState {}
