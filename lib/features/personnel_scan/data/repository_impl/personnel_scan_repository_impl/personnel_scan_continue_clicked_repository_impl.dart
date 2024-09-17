
import 'package:injectable/injectable.dart';
import 'package:secure_access/core/base_classes/back_end_calls.dart';
import 'package:secure_access/core/failures/base_failure.dart';
import 'package:secure_access/features/personnel_scan/data/data_source/remote/personnel_scan_remote_service.dart';
import 'package:secure_access/features/personnel_scan/domain/repository/personnel_scan_repository/personnel_scan_continue_clicked_repository.dart';

@Injectable(as: PersonnelScanContinueClickedRepository)
class PersonnelScanContinueClickedRepositoryImpl extends PersonnelScanContinueClickedRepository {

  PersonnelScanContinueClickedRepositoryImpl({required this.personnelScanRemoteService});

  final PersonnelScanRemoteService personnelScanRemoteService;
  @override
  Future<void> call({
    PersonnelScanContinueClickedRepositoryParams? params,
    required Function(String? model)? onSuccess,
    required Function(BaseFailure? error)? onError}) async{
    await safeBackEndCalls(
        apiRequest: personnelScanRemoteService.personnelScanContinueClicked(
            personnelScanContinueClickedModel: params!.personnelScanContinueClickedModel),
        onSuccess: (model)=> onSuccess!(model),
        onError:(error)=> onError!(error));
  }
  

}
