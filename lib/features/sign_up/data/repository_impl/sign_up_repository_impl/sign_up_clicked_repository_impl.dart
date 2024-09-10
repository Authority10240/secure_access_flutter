import 'package:firebase_auth/firebase_auth.dart';
import 'package:secure_access/core/base_classes/back_end_calls.dart';
import 'package:injectable/injectable.dart';
import 'package:secure_access/core/failures/base_failure.dart';
import 'package:secure_access/features/sign_up/data/source/remote/sign_up_service.dart';
import 'package:secure_access/features/sign_up/domain/repository/sign_up_repository/sign_up_clicked_repository.dart';

@Injectable(as: SignUpClickedRepository)
class SignUpClickedRepositoryImpl extends SignUpClickedRepository {


  final SignUpService signUpService;
  SignUpClickedRepositoryImpl({required this.signUpService});

  @override
  Future<void> call({SignUpClickedRepositoryParams? params,
    required Function(UserCredential? model)? onSuccess,
    required Function(BaseFailure? error)? onError}) async{
    await safeBackEndCalls(
        apiRequest: signUpService.signUpClicked(email: params!.username,
            password: params.password),
        onSuccess: (model)=> onSuccess!(model),
        onError: (error)=> onError!(error));
  }
  

}
