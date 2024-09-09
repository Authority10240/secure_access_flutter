import 'package:firebase_auth/firebase_auth.dart';

abstract class SignUpService {

  Future<UserCredential>signUpClicked({required String email, required String password});
}

