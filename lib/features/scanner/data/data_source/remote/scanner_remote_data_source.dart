
import 'package:secure_access_repository/models/secure_access_visitations_vehicle_model/secure_access_visitations_vehicle_model.dart';

abstract class ScannerRemoteDataSource{

  Future<String> scannerContinueClicked({required SecureAccessVisitationsVehicleModel scannerContinueClickedModel});
}