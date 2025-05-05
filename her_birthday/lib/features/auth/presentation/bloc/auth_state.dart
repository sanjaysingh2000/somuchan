sealed class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSucess extends AuthState {
  final String message;
  AuthSucess(this.message);
}

class AuthFailure extends AuthState {
  final String message;
  AuthFailure(this.message);
}


class LogoutSuccess extends AuthState {
  final String message;
  LogoutSuccess(this.message);
}

class OtpSend extends AuthState {
  final String message;
  OtpSend(this.message);
}

class SignupSucess extends AuthState {
  final String message;
  SignupSucess(this.message);
}