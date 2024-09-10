part of 'login_bloc.dart';
@immutable
abstract class LoginPageState extends BaseState {
  bool visiblePassword = false;

  LoginPageState({super.errorCode, super.errorMessage,this.visiblePassword = false});
}

class LoginPageInitState extends LoginPageState  {}

class SignInClickedState extends LoginPageState{

  UserCredential? userCredential;
  SignInClickedState({this.userCredential,super.errorCode,super.visiblePassword, super.errorMessage});
}
class PasswordVisibleState extends LoginPageState{

  PasswordVisibleState({super.visiblePassword});
}

