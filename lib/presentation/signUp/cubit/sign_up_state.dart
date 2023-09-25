part of 'sign_up_cubit.dart';

class SignUpState extends Equatable {
  String email;
  String userName;
  String imageUrl;
  String password;
  String phone;
  SignUpFormState? signUpFormState;
  SignUpState(
      {required this.signUpFormState,
      required this.email,
      required this.phone,
      required this.imageUrl,
      required this.password,
      required this.userName});
  @override
  List get props =>
      [email, userName, password, imageUrl, signUpFormState, phone];

  SignUpState copyWith({
    String? email,
    String? userName,
    String? imageUrl,
    String? password,
    String? phone,
    SignUpFormState? signUpFormState,
  }) {
    return SignUpState(
      email: email ?? this.email,
      userName: userName ?? this.userName,
      imageUrl: imageUrl ?? this.imageUrl,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      signUpFormState: signUpFormState ?? this.signUpFormState,
    );
  }
}
