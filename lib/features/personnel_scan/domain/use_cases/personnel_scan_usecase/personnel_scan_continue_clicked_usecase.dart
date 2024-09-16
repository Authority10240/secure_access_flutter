
import 'package:secure_access/core/base_classes/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:secure_access/core/failures/base_failure.dart';
import 'package:secure_access/features/personnel_scan/data/models/personnel_scan_model_response/personnel_scan_continue_clicked_model.dart';
import 'package:secure_access/features/personnel_scan/domain/repository/personnel_scan_repository/personnel_scan_continue_clicked_repository.dart';

@Injectable()
class PersonnelScanContinueClickedUseCase extends BaseUseCase<PersonnelScanContinueClickedUseCaseParams, bool>{

  final PersonnelScanContinueClickedRepository personnelScanContinueClickedRepository;

  PersonnelScanContinueClickedUseCase({required this.personnelScanContinueClickedRepository});

  @override
  Future<void> call({
    required Function(bool? model)? onSuccess,
    required Function(BaseFailure? error)? onError,
    PersonnelScanContinueClickedUseCaseParams? params})async {
   await personnelScanContinueClickedRepository.call(onSuccess: (model)=>
       onSuccess!(model), onError: (error)=> onError!(error),
   params: PersonnelScanContinueClickedRepositoryParams(personnelScanContinueClickedModel: params!.personnelScanContinueClickedModel));
  }
}

class PersonnelScanContinueClickedUseCaseParams extends BaseUseCaseParams{

  PersonnelScanContinueClickedUseCaseParams({required this.personnelScanContinueClickedModel});
  final PersonnelScanContinueClickedModel personnelScanContinueClickedModel;

}
