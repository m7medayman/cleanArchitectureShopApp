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

  getEmailValidatorText() {
    return FormValidator.getEmailValidatorText(email);
  }

  getPasswordValidatorText() {
    return FormValidator.getPasswordValidatorText(password);
  }

  getUserNameValidatorText() {
    return FormValidator.getFieldValidatorText(userName, "User Name");
  }

  getPhoneValidatorText() {
    return FormValidator.getFieldValidatorText(phone, 'phone');
  }

  bool isFormValid() {
    return (FormValidator.isEmailValid(email) &&
        FormValidator.isPasswordValid(password) &&
        FormValidator.isFieldValid(userName) &&
        FormValidator.isFieldValid(phone));
  }

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
