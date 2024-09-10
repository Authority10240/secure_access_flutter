part of 'sign_up_bloc.dart';
@immutable
abstract class SignUpPageState extends BaseState {
  bool visiblePassword = false;

  SignUpPageState({super.errorCode, super.errorMessage,this.visiblePassword = false});
}

class SignUpPageInitState extends SignUpPageState  {}

class SignUpClickedState extends SignUpPageState{

  final UserCredential? userCredential;

  SignUpClickedState({super.errorCode, super.errorMessage,this.userCredential});
}

class SignUpPasswordVisibleState extends SignUpPageState{

  SignUpPasswordVisibleState({super.visiblePassword});
}