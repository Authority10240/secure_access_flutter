
import 'package:secure_access/core/base_classes/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:secure_access/core/failures/base_failure.dart';
import 'package:secure_access/features/dashboard/data/models/dashboard_model_response/dashboard_page_load_visitations_vehicle_model.dart';
import 'package:secure_access/features/dashboard/domain/repository/dashboard_repository/dashboard_page_load_visitation_vehicle_repository.dart';

@Injectable()
class DashboardPageLoadVisitationVehicleUseCase extends BaseUseCase<DashboardPageLoadVisitationVehicleUseCaseParams, DashboardPageLoadVisitationsVehicleModel>{

  final DashboardPageLoadVisitationVehicleRepository dashboardPageLoadVisitationVehicleRepository;

  DashboardPageLoadVisitationVehicleUseCase({required this.dashboardPageLoadVisitationVehicleRepository});

  @override
  Future<void> call({
    required Function(DashboardPageLoadVisitationsVehicleModel? model)? onSuccess,
    required Function(BaseFailure? error)? onError,
    DashboardPageLoadVisitationVehicleUseCaseParams? params})async {
    await dashboardPageLoadVisitationVehicleRepository.call(
        onSuccess: (model)=> onSuccess!.call(model),
        onError:(error)=> onError!.call(error),
    params: DashboardPageLoadVisitationVehicleRepositoryParams(visitationId: params!.visitationId));
  }
}

class DashboardPageLoadVisitationVehicleUseCaseParams extends BaseUseCaseParams{
  DashboardPageLoadVisitationVehicleUseCaseParams({required this.visitationId});

  final String visitationId;
}
