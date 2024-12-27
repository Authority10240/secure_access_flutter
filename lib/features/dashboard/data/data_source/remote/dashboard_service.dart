import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:secure_access_repository/models/secure_access_visitation_model/secure_access_visitations_model.dart';
import 'package:secure_access_repository/models/secure_access_visitations_vehicle_model/secure_access_visitations_vehicle_model.dart';


abstract class DashboardService {

  Stream<QuerySnapshot<SecureAccessVisitationsModel?>> dashboardPageLoadVisitations();

  Future<SecureAccessVisitationsVehicleModel> dashboardPageLoadVisitationVehicle({required String visitationId, required String date});
}