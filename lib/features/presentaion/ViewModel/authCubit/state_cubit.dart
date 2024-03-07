abstract class AuthState {}

class AuthInit extends AuthState {}

class AuthLoading extends AuthState {}

class Authentified extends AuthState {
  final String token;

  Authentified(this.token);
}

class UnAuth extends AuthState {
  final String failure;

  UnAuth(this.failure);
}
