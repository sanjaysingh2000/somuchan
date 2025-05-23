sealed class AuthEvent {

}

class LoginEvent extends AuthEvent{
  final String email;
  final String password;
  LoginEvent(this.email, this.password);
}


class SignUpEvent extends AuthEvent{
  final String email;
  final String password;
  SignUpEvent(this.email, this.password);
}


class ForgetPassEvent extends AuthEvent{
  final String email;
  ForgetPassEvent(this.email);
}

class LogoutEvent extends AuthEvent{}