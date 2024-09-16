
import 'package:secure_access/core/base_classes/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:secure_access/core/failures/base_failure.dart';
import 'package:secure_access/features/person_details/data/models/person_details_model_response/person_details_continue_clicked_model.dart';
import 'package:secure_access/features/person_details/domain/repository/person_details_repository/person_details_continue_clicked_repository.dart';

@Injectable()
class PersonDetailsContinueClickedUseCase extends BaseUseCase<PersonDetailsContinueClickedUseCaseParams, bool>{

  final PersonDetailsContinueClickedRepository personDetailsContinueClickedRepository;

  PersonDetailsContinueClickedUseCase({required this.personDetailsContinueClickedRepository});

  @override
  Future<void> call({
    required Function(bool? model)? onSuccess,
    required Function(BaseFailure? error)? onError,
    PersonDetailsContinueClickedUseCaseParams? params})async {
   await personDetailsContinueClickedRepository.call(
       onSuccess: (model)=> onSuccess!(model),
       onError: (error)=> onError!(error),
   params: PersonDetailsContinueClickedRepositoryParams(
       personDetailsContinueClickedModel: params!.personDetailsContinueClickedModel));
  }
}

class PersonDetailsContinueClickedUseCaseParams extends BaseUseCaseParams{

   PersonDetailsContinueClickedUseCaseParams({required this.personDetailsContinueClickedModel});

  final PersonDetailsContinueClickedModel personDetailsContinueClickedModel;
}
