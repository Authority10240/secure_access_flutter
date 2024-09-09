part of 'sign_up_bloc.dart';
 @immutable
abstract class SignUpPageEvent extends BaseEvent {}

class SignUpClickedEvent extends SignUpPageEvent{
  final String username;
  final String password;

  SignUpClickedEvent({required this.password, required this.username});
}