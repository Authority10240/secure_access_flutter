import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:secure_access/core/constants/date.dart';
import 'package:secure_access/features/manual_vehicle/data/data_source/remote/manual_vehicle_remote_service.dart';
import 'package:secure_access_repository/models/repository_models.dart';

import '../../../../../core/constants/database.dart';


@Singleton(as:ManualVehicleRemoteService)
class ManualVehicleRemoteServiceIMpl extends ManualVehicleRemoteService{

  ManualVehicleRemoteServiceIMpl({required this.firebaseFirestore});
  final FirebaseFirestore firebaseFirestore;
  late  CollectionReference _visitationsRef;


  @override
  Future<String> manualVehicleContinueClicked({required SecureAccessVisitationsVehicleModel manualVehicleContinueClickedModel}) async {
    try {
      _visitationsRef = firebaseFirestore.collection(visitation_vehicle_details)
          .withConverter<SecureAccessVisitationsVehicleModel>(
          fromFirestore: (snapShot,_)=> SecureAccessVisitationsVehicleModel.fromJson(snapShot.data()!),
          toFirestore:(manualVehicleContinueClickedModel, _ )=> manualVehicleContinueClickedModel.toJson());
      DocumentReference documentReference = await _visitationsRef.add(manualVehicleContinueClickedModel);

      return documentReference.id;

    } catch(ex){
      rethrow;
    }
  }

}