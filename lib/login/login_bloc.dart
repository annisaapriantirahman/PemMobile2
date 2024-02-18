import 'dart:async';

class LoginBloc {
  final _usernameController = StreamController<String>();
  final _passwordController = StreamController<String>();

  // Input streams
  StreamSink<String> get usernameSink => _usernameController.sink;
  StreamSink<String> get passwordSink => _passwordController.sink;

  // Output streams
  Stream<String> get usernameStream => _usernameController.stream;
  Stream<String> get passwordStream => _passwordController.stream;

  // Validate inputs
  Stream<bool> get isValidLogin => Stream<bool>.combine2(
        usernameStream,
        passwordStream,
        (username, password) => username.isNotEmpty && password.isNotEmpty,
      );

  // Clean up
  void dispose() {
    _usernameController.close();
    _passwordController.close();
  }
}
