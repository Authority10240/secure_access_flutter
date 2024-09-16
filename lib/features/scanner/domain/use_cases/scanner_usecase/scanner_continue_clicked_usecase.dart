
import 'package:secure_access/core/base_classes/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:secure_access/core/failures/base_failure.dart';
import 'package:secure_access/features/scanner/data/models/scanner_model_response/scanner_continue_clicked_model.dart';
import 'package:secure_access/features/scanner/domain/repository/scanner_repository/scanner_continue_clicked_repository.dart';

@Injectable()
class ScannerContinueClickedUseCase extends BaseUseCase<ScannerContinueClickedUseCaseParams, bool>{

  final ScannerContinueClickedRepository scannerContinueClickedRepository;

  ScannerContinueClickedUseCase({required this.scannerContinueClickedRepository});

  @override
  Future<void> call({required Function(bool? model)? onSuccess,
    required Function(BaseFailure? error)? onError,
    ScannerContinueClickedUseCaseParams? params})async {
    await scannerContinueClickedRepository.call(
        onSuccess: (model)=> onSuccess!(model),
        onError: (error)=>onError!(error),
    params: ScannerContinueClickedRepositoryParams(
      scannerContinueClickedModel: params!.scannerContinueClickedModel
    ));
  }
}

class ScannerContinueClickedUseCaseParams extends BaseUseCaseParams{
  final ScannerContinueClickedModel scannerContinueClickedModel;

  ScannerContinueClickedUseCaseParams({
    required this.scannerContinueClickedModel
});
}
