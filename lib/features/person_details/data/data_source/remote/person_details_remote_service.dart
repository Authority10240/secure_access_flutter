
import 'package:secure_access_repository/models/secure_access_visitation_model/secure_access_visitations_model.dart';

abstract class PersonDetailsRemoteService{

  Future<String> personDetailsContinueClicked({required SecureAccessVisitationsModel personDetailsContinueClickedModel});
}