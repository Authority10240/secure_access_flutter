import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:secure_access/features/personnel_scan/data/data_source/remote/personnel_scan_remote_service.dart';
import 'package:secure_access_repository/models/secure_access_visitation_model/secure_access_visitations_model.dart';

import '../../../../../core/constants/database.dart';



@Singleton(as: PersonnelScanRemoteService)
class PersonnelScanRemoteServiceImpl extends PersonnelScanRemoteService{

  PersonnelScanRemoteServiceImpl({required this.firebaseFirestore}){
    _visitationsRef = firebaseFirestore.collection(visitation_details_collection)
        .withConverter<SecureAccessVisitationsModel>(
        fromFirestore: (snapShot,_)=> SecureAccessVisitationsModel.fromJson(snapShot.data()!),
        toFirestore:(personnelScanContinueClickedModel, _ )=> personnelScanContinueClickedModel.toJson());
  }

  final FirebaseFirestore firebaseFirestore;
  late  CollectionReference _visitationsRef;

  @override
  Future<String> personnelScanContinueClicked({required SecureAccessVisitationsModel personnelScanContinueClickedModel}) async{
    try{
      DocumentReference documentReference = await _visitationsRef.add(personnelScanContinueClickedModel);
      return documentReference.id;
    }catch(ex){
      rethrow;
    }
  }


}