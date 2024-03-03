abstract class RegisterState {}

class RegisterStateInit extends RegisterState {}

class RegisterStateSuccess extends RegisterState {
  final String successMessage;

  RegisterStateSuccess(this.successMessage);
}

class RegisterStateFailure extends RegisterState {
  final String failureMessage;

  RegisterStateFailure(this.failureMessage);
}

class RegisterStateLoading extends RegisterState {}
