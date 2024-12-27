import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:secure_access/core/failures/base_failure.dart';
import 'package:secure_access/features/dashboard/data/data_source/remote/dashboard_service.dart';
import 'package:secure_access/features/dashboard/domain/repository/dashboard_repository/dashboard_page_load_visitations_repository.dart';
import 'package:secure_access_repository/models/repository_models.dart';

@Injectable(as: DashboardPageLoadVisitationsRepository)
class DashboardPageLoadVisitationsRepositoryImpl extends DashboardPageLoadVisitationsRepository {

  DashboardPageLoadVisitationsRepositoryImpl({required this.dashboardService});

  final DashboardService dashboardService;

  @override
  Future<void> call({DashboardPageLoadVisitationsRepositoryParams? params,
    required Function(Stream<QuerySnapshot<SecureAccessVisitationsModel?>> model)? onSuccess,
    required Function(BaseFailure? error)? onError})async {
    try{
      Stream<QuerySnapshot<SecureAccessVisitationsModel?>>? list = dashboardService.dashboardPageLoadVisitations();
      onSuccess!.call(list);
    }on Exception catch (ex){
      onError!.call(BaseFailure.factory(ex: ex));
    }
  }
  

}
