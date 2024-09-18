import 'package:secure_access/core/base_classes/back_end_calls.dart';
import 'package:injectable/injectable.dart';
import 'package:secure_access/core/failures/base_failure.dart';
import 'package:secure_access/features/manual_vehicle/data/data_source/remote/manual_vehicle_remote_service.dart';
import 'package:secure_access/features/manual_vehicle/domain/repository/manual_vehicle_repository/manual_vehicle_continue_clicked_repository.dart';

@Injectable(as: ManualVehicleContinueClickedRepository)
class ManualVehicleContinueClickedRepositoryImpl extends ManualVehicleContinueClickedRepository {

  ManualVehicleContinueClickedRepositoryImpl({required this.manualVehicleRemoteService});

  final ManualVehicleRemoteService manualVehicleRemoteService;

  @override
  Future<void> call({ManualVehicleContinueClickedRepositoryParams? params,
    required Function(String? model)? onSuccess,
    required Function(BaseFailure? error)? onError})async {
    await safeBackEndCalls(
        apiRequest: manualVehicleRemoteService.manualVehicleContinueClicked(
            manualVehicleContinueClickedModel: params!.manualVehicleContinueClickedModel),
        onSuccess: (model)=> onSuccess!(model),
        onError: (error)=> onError!(error));
  }
  

}
