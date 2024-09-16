part of 'personnel_scan_bloc.dart';
@immutable
abstract class PersonnelScanPageState extends BaseState {
   String? idNUmber;

   PersonnelScanPageState({super.errorCode, super.errorMessage, this.idNUmber});

}

class PersonnelScanPageInitState extends PersonnelScanPageState  {}

class ScanQrState extends PersonnelScanPageState{

  ScanQrState({super.errorCode,super.errorMessage,super.idNUmber});
}