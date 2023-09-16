import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_shop/app/di.dart';
import 'package:mvvm_shop/domain/use_case/forget_password_use_case.dart';
import 'package:mvvm_shop/presentation/forgetPassword/emaiSubmit/cubit/email_freezed.dart';
import 'package:mvvm_shop/presentation/forgetPassword/emaiSubmit/cubit/email_submit_cubit.dart';
import 'package:mvvm_shop/presentation/resources/assets_manager.dart';
import 'package:mvvm_shop/presentation/resources/color_manager.dart';
import 'package:mvvm_shop/presentation/resources/strings_manager.dart';
import 'package:mvvm_shop/presentation/resources/styles_manager.dart';
import 'package:mvvm_shop/presentation/resources/values_manager.dart';
import 'package:mvvm_shop/presentation/state_render/state_renderer.dart';
import 'package:mvvm_shop/presentation/state_render/state_renderer_imp.dart';

class EmailSubmitView extends StatefulWidget {
  EmailSubmitView({super.key});

  @override
  State<EmailSubmitView> createState() => _EmailSubmitViewState();
}

class _EmailSubmitViewState extends State<EmailSubmitView> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    EmailSubmitCubit emailSubmitCubit = EmailSubmitCubit();
    return BlocProvider(
      create: (context) => emailSubmitCubit,
      child: _scaffold(),
    );
  }

  _scaffold() {
    return Scaffold(
      appBar: null,
      body: BlocBuilder<EmailSubmitCubit, FreezedEmailState>(
        builder: (context, state) {
          if (state.emailSubmitState is EmailLoading) {
            StateType.popupLoadingState
                .getPopupDialog(AppStrings.loading, context);
          }
          if (state.emailSubmitState is EmailSuccess) {
            StateType.popupSuccessState
                .getPopupDialog(AppStrings.success, context);
          }
          if (state.emailSubmitState is EmailError) {
            StateType.popupErrorState.getPopupDialog(
                state.emailSubmitState.props.first.toString(), context);
          }
          return _body();
        },
      ),
    );
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
                padding: const EdgeInsets.all(AppSize.s8),
                child: BlocBuilder<EmailSubmitCubit, FreezedEmailState>(
                  builder: (context, state) {
                    return Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextFormField(
                              validator: (value) {
                                if (!state.emailIsValid()) {
                                  return "email should be more than 5 characters";
                                }
                                if (!state.emailContains()) {
                                  return "email should contain '@' character";
                                } else {
                                  return null;
                                }
                              },
                              onChanged: (value) {
                                context
                                    .read<EmailSubmitCubit>()
                                    .onEmailChange(value);
                              },
                              decoration: const InputDecoration(
                                  hintText: AppStrings.emailHint),
                            ),
                            const SizedBox(
                              height: AppSize.h20,
                            ),
                            const SizedBox(
                              height: AppSize.h20,
                            ),
                            _submitEmail(state, context)
                          ],
                        ));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _submitEmail(FreezedEmailState state, BuildContext context) {
    return ElevatedButton(
        onPressed: (state.emailContains() && state.emailIsValid())
            ? () => _onPressed(context)
            : null,
        child: Padding(
          padding: const EdgeInsets.all(AppSize.s10),
          child: Text(
            AppStrings.emailSubmit,
            style: getBoldStyle().copyWith(color: ColorManager.white),
          ),
        ));
  }

  _onPressed(BuildContext context1) {
    context1.read<EmailSubmitCubit>().onEmailSubmitting();
  }
}
