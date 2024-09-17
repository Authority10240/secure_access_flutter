import 'package:secure_access/core/base_classes/back_end_calls.dart';
import 'package:injectable/injectable.dart';
import 'package:secure_access/core/failures/base_failure.dart';
import 'package:secure_access/features/person_details/data/data_source/remote/person_details_remote_service.dart';
import 'package:secure_access/features/person_details/domain/repository/person_details_repository/person_details_continue_clicked_repository.dart';

@Injectable(as: PersonDetailsContinueClickedRepository)
class PersonDetailsContinueClickedRepositoryImpl extends PersonDetailsContinueClickedRepository {

  PersonDetailsContinueClickedRepositoryImpl({required this.personDetailsRemoteService});
  final PersonDetailsRemoteService personDetailsRemoteService;
  @override
  Future<void> call({PersonDetailsContinueClickedRepositoryParams? params,
    required Function(String? model)? onSuccess,
    required Function(BaseFailure? error)? onError})async {

    await safeBackEndCalls(apiRequest: personDetailsRemoteService.personDetailsContinueClicked(
        personDetailsContinueClickedModel: params!.personDetailsContinueClickedModel),
        onSuccess: (model)=> onSuccess!(model),
        onError:(error)=> onError!(error));
  }
  

}
