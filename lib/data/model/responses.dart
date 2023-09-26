class ApiResponse {
  String idToken;
  String expiresIn;
  String refreshToken;
  ApiResponse({
    required this.idToken,
    required this.expiresIn,
    required this.refreshToken,
  });
}

class ApiMessage extends ApiResponse {
  ApiMessage(
      {required String expiresIn,
      required String idToken,
      required String refreshToken})
      : super(
            expiresIn: expiresIn, idToken: idToken, refreshToken: refreshToken);
}

class SignUpDomainRes extends ApiResponse {
  String email;
  String localId;
  SignUpDomainRes(
      {required this.email,
      required this.localId,
      required String expiresIn,
      required String idToken,
      required String refreshToken})
      : super(
            expiresIn: expiresIn, idToken: idToken, refreshToken: refreshToken);
}
