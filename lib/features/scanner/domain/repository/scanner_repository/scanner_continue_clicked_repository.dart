import 'package:secure_access/core/base_classes/base_repository.dart';
import 'package:secure_access/features/scanner/data/models/scanner_model_response/scanner_continue_clicked_model.dart';

abstract class ScannerContinueClickedRepository  extends BaseRepository<ScannerContinueClickedRepositoryParams, bool>{}

class ScannerContinueClickedRepositoryParams extends BaseRepositoryParams{

  ScannerContinueClickedRepositoryParams({required this.scannerContinueClickedModel});
  final ScannerContinueClickedModel scannerContinueClickedModel;
}
