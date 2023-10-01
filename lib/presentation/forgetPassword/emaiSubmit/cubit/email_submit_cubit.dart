import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:mvvm_shop/app/di.dart';
import 'package:mvvm_shop/domain/use_case/forget_password_use_case.dart';
import 'package:mvvm_shop/presentation/forgetPassword/emaiSubmit/cubit/email_freezed.dart';

part 'email_submit_state.dart';

class EmailSubmitCubit extends Cubit<FreezedEmailState> {
  late EmailSubmitUseCase emailUseCase;
  EmailSubmitCubit() : super(FreezedEmailState()) {
    initEmailSubmittingModule()
        .whenComplete(() => emailUseCase = instance<EmailSubmitUseCase>());
  }

  onEmailChange(String emailField) {
    emit(state.copyWith(
        email: emailField, emailSubmitState: const EmailSubmitInitial()));
  }

  onEmailSubmitting() {
    emit(state.copyWith(emailSubmitState: EmailLoading()));
    emailUseCase.execute(EmailSubmitUseCaseInput(state.email)).fold((left) {
      emit(state.copyWith(emailSubmitState: EmailError(left.massage)));
    }, (right) {
      emit(state.copyWith(emailSubmitState: EmailSuccess()));
    });
  }
}
