enum LoginFailureReason { emailNotFound, wrongPassword }
class LoginFailureException implements Exception {
  final LoginFailureReason reason;
  const LoginFailureException(this.reason);
}

enum SignupFailureReason { emailAlreadyExists }
class SignupFailureException implements Exception {
  final SignupFailureReason reason;
  const SignupFailureException(this.reason);
}
