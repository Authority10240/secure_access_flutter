import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:secure_access/core/utils.dart';
import 'package:secure_access/features/personnel_scan/data/data_source/remote/personnel_scan_remote_service.dart';
import 'package:secure_access/features/personnel_scan/data/models/personnel_scan_model_response/personnel_scan_continue_clicked_model.dart';
@Singleton(as: PersonnelScanRemoteService)
class PersonnelScanRemoteServiceImpl extends PersonnelScanRemoteService{

  PersonnelScanRemoteServiceImpl({required this.firebaseFirestore});
final FirebaseFirestore firebaseFirestore;
  @override
  Future<bool> personnelScanContinueClicked({required PersonnelScanContinueClickedModel personScanContinueClickedModel}) async{
    try{
      await firebaseFirestore.collection(currentDate).
      doc(personScanContinueClickedModel.identificationNumber).
      set(personScanContinueClickedModel.toJson());
      return true;
    }catch(ex){
      rethrow;
    }
  }


}