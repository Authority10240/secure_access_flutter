import 'package:secure_access/core/base_classes/back_end_calls.dart';
import 'package:injectable/injectable.dart';
import 'package:secure_access/core/failures/base_failure.dart';
import 'package:secure_access/features/scanner/domain/repository/scanner_repository/scanner_continue_clicked_repository.dart';

@Injectable(as: ScannerContinueClickedRepository)
class ScannerContinueClickedRepositoryImpl extends ScannerContinueClickedRepository {

  ScannerContinueClickedRepositoryImpl();

  @override
  Future<void> call({ScannerContinueClickedRepositoryParams? params, required Function(bool? model)? onSuccess, required Function(BaseFailure? error)? onError}) {
    // TODO: implement call
    throw UnimplementedError();
  }
  

}
