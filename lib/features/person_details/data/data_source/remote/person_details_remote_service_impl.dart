import 'package:injectable/injectable.dart';
import 'package:secure_access/features/person_details/data/data_source/remote/person_details_remote_service.dart';
import 'package:secure_access/features/personnel_scan/data/data_source/remote/Personnel_scan_remote_service.dart';
import 'package:secure_access/features/personnel_scan/data/models/personnel_scan_model_response/personnel_scan_continue_clicked_model.dart';

@Singleton(as: PersonDetailsRemoteService)
class PersonDetailsRemoteServiceImpl extends PersonnelScanRemoteService{
  @override
  Future<bool> personnelScanContinueClicked({required PersonnelScanContinueClickedModel personScanContinueClickedModel}) {
    // TODO: implement personnelScanContinueClicked
    throw UnimplementedError();
  }

}