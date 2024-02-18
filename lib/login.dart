import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aaishop/login/login_bloc.dart';
import 'package:aaishop/login/login_event.dart';
import 'package:aaishop/login/login_state.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext) {
    final _usernameController = TextEditingController();
    final _passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(
          authenticationBloc: BlocProvider.of<authenticationBloc>(context),
        ),
        child: LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _loginBloc = BlocProvider.of<LoginBloc>(context);

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('Login failed'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          if (state is LoginLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(labelText: 'Username'),
                ),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
                ElevatedButton(
                  onPressed: () {
                    _loginBloc.add(LoginButtonPressed(
                      username: _usernameController.text,
                      password: _passwordController.text,
                    ));
                  },
                  child: Text('Login'),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
