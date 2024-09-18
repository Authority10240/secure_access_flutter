
import 'package:secure_access/core/base_classes/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:secure_access/core/failures/base_failure.dart';
import 'package:secure_access/features/manual_vehicle/data/models/manual_vehicle_model_response/manual_vehicle_continue_clicked_model.dart';
import 'package:secure_access/features/manual_vehicle/domain/repository/manual_vehicle_repository/manual_vehicle_continue_clicked_repository.dart';

@Injectable()
class ManualVehicleContinueClickedUseCase extends BaseUseCase<ManualVehicleContinueClickedUseCaseParams, String>{

  final ManualVehicleContinueClickedRepository manualVehicleContinueClickedRepository;

  ManualVehicleContinueClickedUseCase({required this.manualVehicleContinueClickedRepository});

  @override
  Future<void> call({
    required Function(String? model)? onSuccess,
    required Function(BaseFailure? error)? onError,
    ManualVehicleContinueClickedUseCaseParams? params})async {
    await manualVehicleContinueClickedRepository.call(
        onSuccess: (model)=>onSuccess!(model),
        onError:(error)=> onError!(error),
    params: ManualVehicleContinueClickedRepositoryParams(
        manualVehicleContinueClickedModel: params!.manualVehicleContinueClickedModel));
  }
}

class ManualVehicleContinueClickedUseCaseParams extends BaseUseCaseParams{

  final ManualVehicleContinueClickedModel manualVehicleContinueClickedModel;

  ManualVehicleContinueClickedUseCaseParams({required this.manualVehicleContinueClickedModel});
}
