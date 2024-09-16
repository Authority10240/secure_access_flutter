import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:secure_access/core/utils.dart';
import 'package:secure_access/features/scanner/data/data_source/remote/scanner_remote_data_source.dart';
import 'package:secure_access/features/scanner/data/models/scanner_model_response/scanner_continue_clicked_model.dart';
import 'package:intl/intl.dart';


@Singleton(as: ScannerRemoteDataSource)
class ScannerRemoteDataSourceImpl extends ScannerRemoteDataSource{
  
  ScannerRemoteDataSourceImpl({required this.firebaseFirestore});

  final FirebaseFirestore firebaseFirestore;
  @override
  Future<bool> scannerContinueClicked({required ScannerContinueClickedModel scannerContinueClickedModel}) async{
    try {
      await firebaseFirestore.collection(
           currentDate).doc(scannerContinueClickedModel.identificationNumber)
          .update(scannerContinueClickedModel.toJson());

      return true;
    } catch(ex){
       rethrow;
    }
  }



}