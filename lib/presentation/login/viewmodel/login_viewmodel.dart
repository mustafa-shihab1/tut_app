import 'dart:async';

import 'package:tut_app/presentation/base/base_viewmodel.dart';

class LoginViewModel
    implements BaseViewModel, LoginViewModelInputs, LoginViewModelOutputs {
  final StreamController _userNameController =
      StreamController<String>.broadcast();
  final StreamController _passwordController =
      StreamController<String>.broadcast();
  @override
  void dispose() {
    _userNameController.close();
    _passwordController.close();
  }

  @override
  void start() {}

  @override
  Sink get inputPassword => _passwordController.sink;

  @override
  Sink get inputUserName => _userNameController.sink;

  @override
  login() {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  setPassword(String password) {
    // TODO: implement setPassword
    throw UnimplementedError();
  }

  @override
  setUserName(String userName) {
    // TODO: implement setUserName
    throw UnimplementedError();
  }

  @override
  Stream<bool> get isOutputPasswordValid =>
      _passwordController.stream.map((password) => _isPasswordValid(password));

  @override
  Stream<bool> get isOutputUserNameValid =>
      _userNameController.stream.map((name) => _isUserNameValid(name));

  bool _isPasswordValid(String password) => password.isNotEmpty;
  bool _isUserNameValid(String userName) => userName.isNotEmpty;
}

abstract class LoginViewModelInputs {
  setUserName(String userName);
  setPassword(String password);
  login();

  Sink get inputUserName;
  Sink get inputPassword;
}

abstract class LoginViewModelOutputs {
  Stream<bool> get isOutputUserNameValid;
  Stream<bool> get isOutputPasswordValid;
}
