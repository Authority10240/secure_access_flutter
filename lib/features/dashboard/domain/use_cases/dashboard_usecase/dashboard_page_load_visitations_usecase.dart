
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:secure_access/core/base_classes/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:secure_access/core/failures/base_failure.dart';
import 'package:secure_access/features/dashboard/domain/repository/dashboard_repository/dashboard_page_load_visitations_repository.dart';
import 'package:secure_access_repository/models/repository_models.dart';

@Injectable()
class DashboardPageLoadVisitationsUseCase extends BaseUseCase<DashboardPageLoadVisitationsUseCaseParams, Stream<QuerySnapshot<Object?>>>{

  final DashboardPageLoadVisitationsRepository dashboardPageLoadVisitationsRepository;

  DashboardPageLoadVisitationsUseCase({required this.dashboardPageLoadVisitationsRepository});

  @override
  Future<void> call({
    required Function(Stream<QuerySnapshot<SecureAccessVisitationsModel?>>? model)? onSuccess,
    required Function(BaseFailure? error)? onError,
    DashboardPageLoadVisitationsUseCaseParams? params}) async {
    await dashboardPageLoadVisitationsRepository.call(
        onSuccess: (model)=> onSuccess!(model),
        onError:(error)=> onError!(error));
  }
}

class DashboardPageLoadVisitationsUseCaseParams extends BaseUseCaseParams{}
