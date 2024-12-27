import 'package:secure_access/core/base_classes/base_repository.dart';
import 'package:secure_access_repository/models/secure_access_visitations_vehicle_model/secure_access_visitations_vehicle_model.dart';

abstract class ScannerContinueClickedRepository  extends BaseRepository<ScannerContinueClickedRepositoryParams, String>{}

class ScannerContinueClickedRepositoryParams extends BaseRepositoryParams{

  ScannerContinueClickedRepositoryParams({required this.scannerContinueClickedModel});
  final SecureAccessVisitationsVehicleModel scannerContinueClickedModel;
}
