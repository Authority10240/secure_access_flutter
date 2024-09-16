import 'package:secure_access/features/scanner/data/models/scanner_model_response/scanner_continue_clicked_model.dart';

abstract class ScannerRemoteDataSource{

  Future<bool> scannerContinueClicked({required ScannerContinueClickedModel scannerContinueClickedModel});
}