import 'package:equatable/equatable.dart';
import 'package:mvvm_shop/presentation/login/bloc/login_bloc.dart';

class LoginDataState extends Equatable {
  String email;
  String password;
  AuthState authState;

  bool isEmailValid() {
    print(email.length);
    return email.length > 5;
  }

  bool isEmailFormFieldValid() {
    return email.contains("@");
  }

  bool isPasswordValid() {
    return password.length > 5;
  }

  LoginDataState(
      {this.email = '',
      this.password = '',
      this.authState = const AuthInitial()});

  LoginDataState copyWith({
    String? email,
    String? password,
    AuthState? authState,
  }) {
    return LoginDataState(
      email: email ?? this.email,
      password: password ?? this.password,
      authState: authState ?? this.authState,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [email, password, authState];
}
