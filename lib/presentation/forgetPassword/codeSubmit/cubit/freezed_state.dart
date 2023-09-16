import 'package:mvvm_shop/presentation/forgetPassword/codeSubmit/cubit/code_cubit.dart';

class FreezedCodeState {
  String code;
  CodeState codeSubmitState;
  FreezedCodeState(
      {this.code = '', this.codeSubmitState = const CodeInitial()});
  bool codeIsValid() {
    return code.length > 5;
  }

  FreezedCodeState copyWith({
    String? code,
    CodeState? codeSubmitState,
  }) {
    return FreezedCodeState(
        code: code ?? this.code,
        codeSubmitState: codeSubmitState ?? this.codeSubmitState);
  }
}
