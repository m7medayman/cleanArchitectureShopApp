import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvvm_shop/app/di.dart';
import 'package:mvvm_shop/domain/use_case/login_usecase.dart';
import 'package:mvvm_shop/presentation/login/bloc/login_bloc.dart';
import 'package:mvvm_shop/presentation/login/bloc/login_data.dart';
import 'package:mvvm_shop/presentation/resources/assets_manager.dart';
import 'package:mvvm_shop/presentation/resources/color_manager.dart';
import 'package:mvvm_shop/presentation/resources/strings_manager.dart';
import 'package:mvvm_shop/presentation/resources/styles_manager.dart';
import 'package:mvvm_shop/presentation/resources/values_manager.dart';
import 'package:mvvm_shop/presentation/state_render/state_renderer.dart';
import 'package:mvvm_shop/presentation/state_render/state_renderer_imp.dart';

class LoginView extends StatefulWidget {
  LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(context: context),
      child: _scaffold(),
    );
  }

  Scaffold _scaffold() {
    return Scaffold(
        appBar: null,
        body: BlocBuilder<LoginBloc, LoginDataState>(
          builder: (context, state) {
            final _state = state.authState.props;
            if (state.authState is AuthLoading) {
              StateType.popupLoadingState
                  .getPopupDialog(AppStrings.loading, context);
              return _body();
            }
            if (state.authState is AuthFailure) {
              StateType.popupErrorState
                  .getPopupDialog(_state.first.toString(), context);
              return _body();
            }
            if (state.authState is AuthSuccess) {
              StateType.popupSuccessState
                  .getPopupDialog(AppStrings.success, context);
              return _body();
            }
            return _body();
          },
        ));
  }

  Center _body() {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSize.s20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(ImageAssets.splashLogo),
              Padding(
                padding: EdgeInsets.all(AppSize.s8),
                child: BlocBuilder<LoginBloc, LoginDataState>(
                  builder: (context, state) {
                    return Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextFormField(
                              validator: (value) {
                                if (!state.isEmailValid()) {
                                  return "email should be more than 5 characters";
                                }
                                if (!state.isEmailFormFieldValid()) {
                                  return "email should contain '@' character";
                                }
                              },
                              onChanged: (value) {
                                context
                                    .read<LoginBloc>()
                                    .add(EmailChanged(email: value));
                                SchedulerBinding.instance!
                                    .addPostFrameCallback((_) {
                                  _formKey.currentState!.validate();
                                });
                              },
                              decoration: InputDecoration(
                                  hintText: AppStrings.emailHint),
                            ),
                            SizedBox(
                              height: AppSize.h20,
                            ),
                            TextField(
                              onChanged: (value) => context
                                  .read<LoginBloc>()
                                  .add(PasswordChanged(password: value)),
                              decoration: InputDecoration(
                                  hintText: AppStrings.password),
                            ),
                            SizedBox(
                              height: AppSize.h20,
                            ),
                            _loginButton(state, context)
                          ],
                        ));
                  },
                ),
              ),
              BlocBuilder<LoginBloc, LoginDataState>(
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.all(AppSize.s8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {
                              context
                                  .read<LoginBloc>()
                                  .add(ForgotPasswordPressed());
                            },
                            child: Text(
                              AppStrings.forgetPassword,
                              style: getSemiBoldStyle()
                                  .copyWith(color: ColorManager.primary),
                            )),
                        TextButton(
                            onPressed: () {},
                            child: Text(AppStrings.forgetPassword,
                                style: getSemiBoldStyle()
                                    .copyWith(color: ColorManager.primary)))
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton _loginButton(LoginDataState state, BuildContext context) {
    return ElevatedButton(
        onPressed: (state.isEmailValid() && state.isPasswordValid())
            ? () => _onPressed(context)
            : null,
        child: Padding(
          padding: const EdgeInsets.all(AppSize.s10),
          child: Text(
            AppStrings.login,
            style: getBoldStyle().copyWith(color: ColorManager.white),
          ),
        ));
  }
}

_onPressed(BuildContext context) {
  context.read<LoginBloc>().add(LoginButtonPressed());
}
