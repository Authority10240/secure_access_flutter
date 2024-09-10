import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:secure_access/features/sign_up/data/source/remote/sign_up_service.dart';

@Injectable(as: SignUpService)
class SignUpServiceImpl extends SignUpService{

  SignUpServiceImpl({required this.firebaseAuth});

  FirebaseAuth firebaseAuth;
  @override
  Future<UserCredential> signUpClicked({required String email, required String password})async {
    try{
      return await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    }catch(ex){
      rethrow;
    }
  }
  }