import 'package:mvvm_shop/presentation/forgetPassword/emaiSubmit/cubit/email_submit_cubit.dart';

class FreezedEmailState {
  String email;
  EmailSubmitState emailSubmitState;
  FreezedEmailState(
      {this.email = '', this.emailSubmitState = const EmailSubmitInitial()});
  bool emailIsValid() {
    return email.length > 5;
  }

  bool emailContains() {
    return email.contains("@");
  }

  FreezedEmailState copyWith({
    String? email,
    EmailSubmitState? emailSubmitState,
  }) {
    return FreezedEmailState(
        email: email ?? this.email,
        emailSubmitState: emailSubmitState ?? this.emailSubmitState);
  }
}
