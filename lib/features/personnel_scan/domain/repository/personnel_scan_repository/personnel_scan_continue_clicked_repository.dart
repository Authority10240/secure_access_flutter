import 'package:secure_access/core/base_classes/base_repository.dart';
import 'package:secure_access/features/personnel_scan/data/models/personnel_scan_model_response/personnel_scan_continue_clicked_model.dart';

abstract class PersonnelScanContinueClickedRepository  extends BaseRepository<PersonnelScanContinueClickedRepositoryParams, bool>{}

class PersonnelScanContinueClickedRepositoryParams extends BaseRepositoryParams{

  PersonnelScanContinueClickedRepositoryParams({required this.personnelScanContinueClickedModel});

  final PersonnelScanContinueClickedModel personnelScanContinueClickedModel;
}
