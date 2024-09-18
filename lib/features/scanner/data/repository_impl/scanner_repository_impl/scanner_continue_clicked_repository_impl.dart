import 'package:secure_access/core/base_classes/back_end_calls.dart';
import 'package:injectable/injectable.dart';
import 'package:secure_access/core/failures/base_failure.dart';
import 'package:secure_access/features/scanner/data/data_source/remote/scanner_remote_data_source.dart';
import 'package:secure_access/features/scanner/domain/repository/scanner_repository/scanner_continue_clicked_repository.dart';

@Injectable(as: ScannerContinueClickedRepository)
class ScannerContinueClickedRepositoryImpl extends ScannerContinueClickedRepository {

  ScannerContinueClickedRepositoryImpl({
    required this.scannerRemoteDataSource
});

  final ScannerRemoteDataSource scannerRemoteDataSource;

  @override
  Future<void> call({
    ScannerContinueClickedRepositoryParams? params,
    required Function(String? model)? onSuccess,
    required Function(BaseFailure? error)? onError})async {
   await safeBackEndCalls(apiRequest: scannerRemoteDataSource.scannerContinueClicked(
       scannerContinueClickedModel: params!.scannerContinueClickedModel),
       onSuccess: (model)=> onSuccess!(model),
       onError: (error)=> onError!(error));
  }
  

}
