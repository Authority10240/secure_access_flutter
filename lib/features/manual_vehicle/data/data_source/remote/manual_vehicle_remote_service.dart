
import 'package:secure_access_repository/models/secure_access_visitations_vehicle_model/secure_access_visitations_vehicle_model.dart';

abstract class ManualVehicleRemoteService {

  Future<String> manualVehicleContinueClicked({required SecureAccessVisitationsVehicleModel manualVehicleContinueClickedModel});
}