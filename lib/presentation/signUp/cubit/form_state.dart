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

class FormStateFailure extends SignUpFormState {
  final String errorMessage;
  FormStateFailure(this.errorMessage);
  @override
  List<Object?> get props => [errorMessage];
}

class FormStateSuccess extends SignUpFormState {}

class FormStateLoading extends SignUpFormState {}
