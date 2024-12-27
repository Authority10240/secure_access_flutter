import 'package:secure_access/core/base_classes/base_repository.dart';
import 'package:secure_access_repository/models/secure_access_visitation_model/secure_access_visitations_model.dart';

abstract class PersonnelScanContinueClickedRepository  extends BaseRepository<PersonnelScanContinueClickedRepositoryParams, String>{}

class PersonnelScanContinueClickedRepositoryParams extends BaseRepositoryParams{

  PersonnelScanContinueClickedRepositoryParams({required this.personnelScanContinueClickedModel});

  final SecureAccessVisitationsModel personnelScanContinueClickedModel;
}
