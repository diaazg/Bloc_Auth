abstract class LoginState {}

class LoginInitState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final String jwt;

  LoginSuccessState(this.jwt);
}

class LoginFailureState extends LoginState {
  final String failure;

  LoginFailureState(this.failure);
}
