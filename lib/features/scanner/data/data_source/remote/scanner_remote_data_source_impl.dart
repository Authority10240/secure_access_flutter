import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:secure_access/core/utils.dart';
import 'package:secure_access/features/scanner/data/data_source/remote/scanner_remote_data_source.dart';
import 'package:secure_access/features/scanner/data/models/scanner_model_response/scanner_continue_clicked_model.dart';
import 'package:intl/intl.dart';

const String visitation_details_collection = "visitations";
const String visitation_vehicle_details = "vehicle";

@Singleton(as: ScannerRemoteDataSource)
class ScannerRemoteDataSourceImpl extends ScannerRemoteDataSource{
  
  ScannerRemoteDataSourceImpl({required this.firebaseFirestore});

  final FirebaseFirestore firebaseFirestore;
  late final CollectionReference _visitationsRef;
  @override
  Future<String> scannerContinueClicked({required ScannerContinueClickedModel scannerContinueClickedModel}) async{
    try {
      _visitationsRef = firebaseFirestore.collection(visitation_details_collection).doc(scannerContinueClickedModel.identificationNumber).collection(visitation_vehicle_details)
        .withConverter<ScannerContinueClickedModel>(
    fromFirestore: (snapShot,_)=> ScannerContinueClickedModel.fromJson(snapShot.data()!),
    toFirestore:(scannerContinueClickedModel, _ )=> scannerContinueClickedModel.toJson());
      DocumentReference documentReference = await _visitationsRef.add(scannerContinueClickedModel);

      return documentReference.id;

    } catch(ex){
       rethrow;
    }
  }



}