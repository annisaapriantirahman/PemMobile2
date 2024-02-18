abstract class LoginState {}

class InitialLoginState extends LoginState {}

class LoadingLoginState extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginFailureState extends LoginState {
  final String errorMessage;

  LoginFailureState({required this.errorMessage});
}
