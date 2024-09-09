import 'package:firebase_auth/firebase_auth.dart';
import 'package:secure_access/core/base_classes/base_repository.dart';

abstract class SignUpClickedRepository  extends BaseRepository<SignUpClickedRepositoryParams, UserCredential>{}

class SignUpClickedRepositoryParams extends BaseRepositoryParams{
  final String username;
  final String password;

  SignUpClickedRepositoryParams({required this.password, required this.username});
}
