import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:secure_access/core/utils.dart';
import 'package:secure_access/features/personnel_scan/data/data_source/remote/personnel_scan_remote_service.dart';
import 'package:secure_access/features/personnel_scan/data/models/personnel_scan_model_response/personnel_scan_continue_clicked_model.dart';

const String visitation_details_collection = "visitations";

@Singleton(as: PersonnelScanRemoteService)
class PersonnelScanRemoteServiceImpl extends PersonnelScanRemoteService{

  PersonnelScanRemoteServiceImpl({required this.firebaseFirestore}){
    _visitationsRef = firebaseFirestore.collection(visitation_details_collection)
        .withConverter<PersonnelScanContinueClickedModel>(
        fromFirestore: (snapShot,_)=> PersonnelScanContinueClickedModel.fromJson(snapShot.data()!),
        toFirestore:(personnelScanContinueClickedModel, _ )=> personnelScanContinueClickedModel.toJson());
  }

  final FirebaseFirestore firebaseFirestore;
  late  CollectionReference _visitationsRef;

  @override
  Future<String> personnelScanContinueClicked({required PersonnelScanContinueClickedModel personnelScanContinueClickedModel}) async{
    try{
      DocumentReference documentReference = await _visitationsRef.add(personnelScanContinueClickedModel);
      return documentReference.id;
    }catch(ex){
      rethrow;
    }
  }


}