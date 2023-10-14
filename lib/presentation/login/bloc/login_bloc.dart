import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_shop/app/di.dart';
import 'package:mvvm_shop/data/network/failure.dart';
import 'package:mvvm_shop/domain/use_case/login_usecase.dart';
import 'package:mvvm_shop/presentation/login/bloc/login_data.dart';
import 'package:mvvm_shop/presentation/resources/routs_manager.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginDataState> {
  BuildContext context;
  LoginBloc({required this.context})
      : super(LoginDataState(
            email: '', password: '', authState: const AuthInitial())) {
    initLoginModule();
    final LoginUseCase loginUseCase = instance<LoginUseCase>();
    on<LoginEvent>((event, emit) async {
      if (event is EmailChanged) {
        print('email changed');
        emit(
            state.copyWith(email: event.email, authState: const AuthInitial()));
      }
      if (event is ForgotPasswordPressed) {
        Navigator.of(context).pushNamed(Routs.forgetPasswordEmailSubmit);
      }

      if (event is PasswordChanged) {
        print('password changed');
        emit(state.copyWith(
            password: event.password, authState: const AuthInitial()));
      }
      if (event is LoginButtonPressed) {
        print('submit');
        print('email');
        print(state.email);
        print('password');
        print(state.password);
        emit(state.copyWith(authState: AuthLoading()));

        (await loginUseCase
                .execute(LoginUseCaseInput(state.email, state.password)))
            .fold((Failure failure) {
          print(failure.message);
          emit(
              state.copyWith(authState: AuthFailure(message: failure.message)));
        }, (right) {
          emit(state.copyWith(authState: AuthSuccess()));
          Future.delayed(const Duration(seconds: 4), () {
            Navigator.of(context).pushReplacementNamed(Routs.home);
          });
        });
      }
    });
  }
}
