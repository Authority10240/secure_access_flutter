import 'package:secure_access/features/personnel_scan/data/models/personnel_scan_model_response/personnel_scan_continue_clicked_model.dart';

abstract class PersonnelScanRemoteService {

  Future<String> personnelScanContinueClicked({required PersonnelScanContinueClickedModel personnelScanContinueClickedModel});
}