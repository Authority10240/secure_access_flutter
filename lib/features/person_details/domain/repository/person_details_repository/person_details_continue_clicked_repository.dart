import 'package:secure_access/core/base_classes/base_repository.dart';
import 'package:secure_access/features/person_details/data/models/person_details_model_response/person_details_continue_clicked_model.dart';

abstract class PersonDetailsContinueClickedRepository  extends BaseRepository<PersonDetailsContinueClickedRepositoryParams, String>{}

class PersonDetailsContinueClickedRepositoryParams extends BaseRepositoryParams{

  PersonDetailsContinueClickedRepositoryParams({required this.personDetailsContinueClickedModel});
  final PersonDetailsContinueClickedModel personDetailsContinueClickedModel;
}
