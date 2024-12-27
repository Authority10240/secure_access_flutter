import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:secure_access/core/constants/date.dart';
import 'package:secure_access/features/dashboard/data/data_source/remote/dashboard_service.dart';
import 'package:secure_access_repository/models/secure_access_visitation_model/secure_access_visitations_model.dart';
import 'package:secure_access_repository/models/secure_access_visitations_vehicle_model/secure_access_visitations_vehicle_model.dart';

import '../../../../../core/constants/database.dart';



@Singleton(as: DashboardService)
class DashboardServiceImpl extends DashboardService{

  DashboardServiceImpl({required this.firebaseFirestore}){
    _visitationsRef = firebaseFirestore.collection(visitation_details_collection)
        .withConverter<SecureAccessVisitationsModel>(
        fromFirestore: (snapShot,_)=> SecureAccessVisitationsModel.fromJson(snapShot.data()!),
        toFirestore:(dashboardPageLoadVisitationsModel, _ )=> dashboardPageLoadVisitationsModel.toJson());


  }


  final FirebaseFirestore firebaseFirestore;
  late  CollectionReference<SecureAccessVisitationsModel> _visitationsRef;

  @override
  Stream<QuerySnapshot<SecureAccessVisitationsModel?>> dashboardPageLoadVisitations() {
    Stream<QuerySnapshot<SecureAccessVisitationsModel?>> list = _visitationsRef.where('date' ,isEqualTo: todaysDate  ).snapshots();
    return  list;
  }

  @override
  Future<SecureAccessVisitationsVehicleModel> dashboardPageLoadVisitationVehicle({required String visitationId, required String date})async {
    CollectionReference<SecureAccessVisitationsVehicleModel> _vehicleRef =  FirebaseFirestore.instance.
    collection(visitation_vehicle_details).
    withConverter(
        fromFirestore: (snapShot,_)=> SecureAccessVisitationsVehicleModel.fromJson(snapShot.data()!),
        toFirestore:(dashboardPageLoadVisitationsVehicleModel, _ )=> dashboardPageLoadVisitationsVehicleModel.toJson());

    QuerySnapshot<SecureAccessVisitationsVehicleModel> queryVehicle = await _vehicleRef.
    where('id',isEqualTo: visitationId).
    where('date', isEqualTo: date).snapshots().first;
    List<QueryDocumentSnapshot<SecureAccessVisitationsVehicleModel>> queryDocumentVehicle = queryVehicle.docs;

    return queryDocumentVehicle.first.data();
  }

}