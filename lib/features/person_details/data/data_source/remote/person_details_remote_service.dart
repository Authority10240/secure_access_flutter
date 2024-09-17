import 'package:secure_access/features/person_details/data/models/person_details_model_response/person_details_continue_clicked_model.dart';

abstract class PersonDetailsRemoteService{

  Future<String> personDetailsContinueClicked({required PersonDetailsContinueClickedModel personDetailsContinueClickedModel});
}