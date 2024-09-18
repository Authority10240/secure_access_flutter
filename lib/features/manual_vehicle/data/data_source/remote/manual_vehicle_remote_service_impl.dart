import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:secure_access/features/manual_vehicle/data/data_source/remote/manual_vehicle_remote_service.dart';
import 'package:secure_access/features/manual_vehicle/data/models/manual_vehicle_model_response/manual_vehicle_continue_clicked_model.dart';

const String visitation_details_collection = "visitations";
const String visitation_vehicle_details = "vehicle";

@Singleton(as:ManualVehicleRemoteService)
class ManualVehicleRemoteServiceIMpl extends ManualVehicleRemoteService{

  ManualVehicleRemoteServiceIMpl({required this.firebaseFirestore});
  final FirebaseFirestore firebaseFirestore;
  late  CollectionReference _visitationsRef;


  @override
  Future<String> manualVehicleContinueClicked({required ManualVehicleContinueClickedModel manualVehicleContinueClickedModel}) async {
    try {
      _visitationsRef = firebaseFirestore.collection(visitation_details_collection).doc(manualVehicleContinueClickedModel.identificationNumber).collection(visitation_vehicle_details)
          .withConverter<ManualVehicleContinueClickedModel>(
          fromFirestore: (snapShot,_)=> ManualVehicleContinueClickedModel.fromJson(snapShot.data()!),
          toFirestore:(manualVehicleContinueClickedModel, _ )=> manualVehicleContinueClickedModel.toJson());
      DocumentReference documentReference = await _visitationsRef.add(manualVehicleContinueClickedModel);

      return documentReference.id;

    } catch(ex){
      rethrow;
    }
  }

}