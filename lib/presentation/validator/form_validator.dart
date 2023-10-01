class FormValidator {
  static getEmailValidatorText(String email) {
    if (email.isEmpty) return "email is empty";
    if (email.length < 3) return "invalid email";
    if (!(email.contains("@"))) return "email must contains @ ";
    return null;
  }

  static getPasswordValidatorText(String password) {
    if (password.isEmpty) return "password is empty";
    if (password.length < 3) return "invalid password";
    return null;
  }

  static bool isEmailValid(String email) {
    return (email.isNotEmpty) && (email.contains("@")) && (email.length > 3);
  }

  static bool isPasswordValid(String password) {
    return (password.isNotEmpty) && (password.length > 3);
  }

  static getFieldValidatorText(String field, String fieldName) {
    if (field.isEmpty) return "$fieldName is empty";
    if (field.length < 3) return "invalid $fieldName";
    return null;
  }

  static bool isFieldValid(String field) {
    return (field.isNotEmpty) && (field.length > 3);
  }
}
