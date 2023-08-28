import 'package:flutter/material.dart';
import 'package:tut_app/presentation/login/viewmodel/login_viewmodel.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginViewModel _viewModel = LoginViewModel();
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  _bind(){
    _viewModel.start();
    _userNameController.addListener(() {
      _viewModel.setUserName(_userNameController.text);
    });
    _passwordController.addListener(() {
      _viewModel.setPassword(_passwordController.text);
    });
  }

  @override
  initState(){
    _bind();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  @override
  dispose() {
    _viewModel.dispose();
    super.dispose();
  }

}