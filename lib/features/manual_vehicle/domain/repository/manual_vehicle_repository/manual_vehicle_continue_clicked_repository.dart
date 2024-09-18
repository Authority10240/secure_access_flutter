import 'package:secure_access/core/base_classes/base_repository.dart';
import 'package:secure_access/features/manual_vehicle/data/models/manual_vehicle_model_response/manual_vehicle_continue_clicked_model.dart';

abstract class ManualVehicleContinueClickedRepository  extends BaseRepository<ManualVehicleContinueClickedRepositoryParams, String>{}

class ManualVehicleContinueClickedRepositoryParams extends BaseRepositoryParams{

  final ManualVehicleContinueClickedModel manualVehicleContinueClickedModel;

  ManualVehicleContinueClickedRepositoryParams({required this.manualVehicleContinueClickedModel});
}
