import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:mvvm_shop/app/di.dart';
import 'package:mvvm_shop/domain/use_case/post_user_data_usecase.dart';
import 'package:mvvm_shop/domain/use_case/signUp_use_case.dart';
import 'package:mvvm_shop/presentation/signUp/cubit/form_state.dart';

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
    emit(state.copyWith(email: e));
  }

  setPassword(String p) {
    emit(state.copyWith(password: p));
  }

  setUserName(String u) {
    emit(state.copyWith(userName: u));
  }

  setImageUrl(String url) {
    emit(state.copyWith(imageUrl: url));
  }

  setPhone(String phone) {
    emit(state.copyWith(phone: phone));
  }

  executeSignUp() async {
    emit(state.copyWith(signUpFormState: FormStateLoading()));
    await _signUpApi
        .execute(SignUpUseCaseInput(state.email, state.password))
        .fold((signUpError) {
      emit(state.copyWith(
          signUpFormState: FormStateFailure(signUpError.massage)));
    }, (domainRes) async {
      print("!!!!!!!!!!!!!!!!!");
      print(domainRes.email == '' ? 'empty' : domainRes.email);
      _postUserData
          .execute(PostDataUseCaseInput("r787lBhh5axJefvxSjTh", state.email, '',
              state.phone, state.userName))
          .fold((left) {
        emit(state.copyWith(signUpFormState: FormStateFailure(left.massage)));
      }, (right) {
        emit(state.copyWith(signUpFormState: FormStateSuccess()));
      });
    });
  }
}
