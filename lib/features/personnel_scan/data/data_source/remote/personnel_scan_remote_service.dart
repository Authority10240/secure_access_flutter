import 'package:secure_access_repository/models/repository_models.dart';

abstract class PersonnelScanRemoteService {

  Future<String> personnelScanContinueClicked({required SecureAccessVisitationsModel personnelScanContinueClickedModel});
}