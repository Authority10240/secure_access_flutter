import 'package:secure_access/features/manual_vehicle/data/models/manual_vehicle_model_response/manual_vehicle_continue_clicked_model.dart';

abstract class ManualVehicleRemoteService {

  Future<String> manualVehicleContinueClicked({required ManualVehicleContinueClickedModel manualVehicleContinueClickedModel});
}