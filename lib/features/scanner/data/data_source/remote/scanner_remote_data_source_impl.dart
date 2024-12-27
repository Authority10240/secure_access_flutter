import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:secure_access/core/constants/date.dart';
import 'package:secure_access/features/scanner/data/data_source/remote/scanner_remote_data_source.dart';
import 'package:secure_access_repository/models/secure_access_visitations_vehicle_model/secure_access_visitations_vehicle_model.dart';

import '../../../../../core/constants/database.dart';


@Singleton(as: ScannerRemoteDataSource)
class ScannerRemoteDataSourceImpl extends ScannerRemoteDataSource{
  
  ScannerRemoteDataSourceImpl({required this.firebaseFirestore});

  final FirebaseFirestore firebaseFirestore;
  late  CollectionReference _visitationsRef;
  @override
  Future<String> scannerContinueClicked({required SecureAccessVisitationsVehicleModel scannerContinueClickedModel}) async{
    try {
      _visitationsRef = firebaseFirestore.collection(visitation_vehicle_details)
        .withConverter<SecureAccessVisitationsVehicleModel>(
    fromFirestore: (snapShot,_)=> SecureAccessVisitationsVehicleModel.fromJson(snapShot.data()!),
    toFirestore:(scannerContinueClickedModel, _ )=> scannerContinueClickedModel.toJson());
      DocumentReference documentReference = await _visitationsRef.add(scannerContinueClickedModel);

      return documentReference.id;

    } catch(ex){
       rethrow;
    }
  }



}