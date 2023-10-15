import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:mvvm_shop/app/di.dart';
import 'package:mvvm_shop/domain/use_case/post_user_data_usecase.dart';
import 'package:mvvm_shop/domain/use_case/signUp_use_case.dart';
import 'package:mvvm_shop/presentation/signUp/cubit/form_state.dart';
import 'package:mvvm_shop/presentation/validator/form_validator.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  late SignUpUseCase _signUpApi;
  late PostUserDataUseCase _postUserData;
  SignUpCubit()
      : super(SignUpState(
            signUpFormState: const InitFormState(),
            email: '',
            password: '',
            imageUrl: '',
            userName: '',
            phone: '')) {
    initSignUpModule().whenComplete(() {
      _signUpApi = instance<SignUpUseCase>();
      _postUserData = instance<PostUserDataUseCase>();
    });
  }
  setEmail(String e) {
    emit(state.copyWith(
        email: e.trim(), signUpFormState: const InitFormState()));
  }

  setPassword(String p) {
    emit(state.copyWith(
        password: p.trim(), signUpFormState: const InitFormState()));
  }

  setUserName(String u) {
    emit(state.copyWith(userName: u, signUpFormState: const InitFormState()));
  }

  setImageUrl(String url) {
    emit(state.copyWith(imageUrl: url, signUpFormState: const InitFormState()));
  }

  setPhone(String phone) {
    emit(state.copyWith(
        phone: phone.trim(), signUpFormState: const InitFormState()));
  }

  executeSignUp() async {
    emit(state.copyWith(signUpFormState: LoadingFormState()));
    await _signUpApi
        .execute(SignUpUseCaseInput(state.email, state.password))
        .fold((signUpError) {
      emit(state.copyWith(
          signUpFormState: FailureFormState(signUpError.message)));
    }, (domainRes) async {
      print("!!!!!!!!!!!!!!!!!");
      print(domainRes.email == '' ? 'empty' : domainRes.email);
      _postUserData
          .execute(PostDataUseCaseInput("r787lBhh5axJefvxSjTh", state.email, '',
              state.phone, state.userName))
          .fold((left) {
        emit(state.copyWith(signUpFormState: FailureFormState(left.message)));
      }, (right) {
        emit(state.copyWith(signUpFormState: SuccessFormState()));
      });
    });
  }
}
