import 'package:secure_access/core/base_classes/base_repository.dart';
import 'package:secure_access/features/dashboard/data/models/dashboard_model_response/dashboard_page_load_visitations_vehicle_model.dart';

abstract class DashboardPageLoadVisitationVehicleRepository  extends BaseRepository<DashboardPageLoadVisitationVehicleRepositoryParams, DashboardPageLoadVisitationsVehicleModel>{}

class DashboardPageLoadVisitationVehicleRepositoryParams extends BaseRepositoryParams{

  DashboardPageLoadVisitationVehicleRepositoryParams({required this.visitationId});

  final String visitationId;
}
