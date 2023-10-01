part of 'login_bloc.dart';

class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthLoading extends AuthState {}

class AuthFailure extends AuthState {
  final String message;
  const AuthFailure({
    required this.message,
  });
  @override
  List<Object> get props => [message];
}

class AuthSuccess extends AuthState {}
