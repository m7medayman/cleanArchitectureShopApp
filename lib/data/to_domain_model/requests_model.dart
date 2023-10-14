abstract class Request {}

class EmailRequest extends Request {
  String email;
  EmailRequest(this.email);
}

class CodeRequest extends Request {
  String code;
  CodeRequest(this.code);
}

class LoginRequest extends Request {
  String email;
  String password;
  LoginRequest(this.email, this.password);
}

class SignUpRequest extends Request {
  String email;
  String password;
  SignUpRequest(this.email, this.password);
}

class UserProfileRequest extends Request {
  String email;
  String userName;
  String imageUrl;
  String phone;
  UserProfileRequest(
      {required this.email,
      required this.userName,
      required this.imageUrl,
      required this.phone});
}
