import 'package:equatable/equatable.dart';

class SignUpFormState extends Equatable {
  const SignUpFormState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class InitFormState extends SignUpFormState {
  const InitFormState();
}

class FailureFormState extends SignUpFormState {
  final String errorMessage;
  const FailureFormState(this.errorMessage);
  @override
  List<Object?> get props => [errorMessage];
}

class SuccessFormState extends SignUpFormState {}

class LoadingFormState extends SignUpFormState {}
