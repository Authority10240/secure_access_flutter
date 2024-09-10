
import 'package:firebase_auth/firebase_auth.dart';
import 'package:secure_access/core/base_classes/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:secure_access/core/failures/base_failure.dart';
import 'package:secure_access/features/sign_up/domain/repository/sign_up_repository/sign_up_clicked_repository.dart';

@Injectable()
class SignUpClickedUseCase extends BaseUseCase<SignUpClickedUseCaseParams, UserCredential>{

  final SignUpClickedRepository signUpClickedRepository;

  SignUpClickedUseCase({required this.signUpClickedRepository});

  @override
  Future<void> call({required Function(UserCredential? model)? onSuccess, required Function(BaseFailure? error)? onError, SignUpClickedUseCaseParams? params}) async {
   await  signUpClickedRepository.call(onSuccess: (model)=> onSuccess!(model),
        onError: (error)=> onError!(error),
    params: SignUpClickedRepositoryParams(password: params!.password, username: params!.username));
  }
}

class SignUpClickedUseCaseParams extends BaseUseCaseParams{

  final String username;
  final String password;

  SignUpClickedUseCaseParams({required this.password, required this.username});
}
