part of 'login_bloc.dart';

class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class PasswordChanged extends LoginEvent {
  final String password;
  const PasswordChanged({required this.password});
  @override
  List<Object> get props => [password];
}

class EmailChanged extends LoginEvent {
  final String email;
  const EmailChanged({required this.email});
  @override
  List<Object> get props => [email];
}

class LoginButtonPressed extends LoginEvent {}

class ForgotPasswordPressed extends LoginEvent {}
