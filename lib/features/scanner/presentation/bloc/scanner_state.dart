part of 'scanner_bloc.dart';
@immutable
abstract class ScannerPageState extends BaseState {
  String? make;
  String? year;
  String? model;
  String? description;
  String? engine;
  String? vin;
  String? licenseNo;
  String? regNo;

  ScannerPageState({super.errorCode,super.errorMessage,this.model,this.description, this.engine, this.licenseNo, this.make, this.regNo, this.vin, this.year});
}

class ScannerPageInitState extends ScannerPageState  {}

class ScanQrState extends ScannerPageState{

  ScanQrState({super.errorCode,super.errorMessage,super.model,super.description, super.engine, super.licenseNo, super.make, super.regNo, super.vin, super.year});
}

class ScannerContinueClickedState extends ScannerPageState{

  String? referenceId;
  ScannerContinueClickedState({this.referenceId, super.errorCode, super.errorMessage});
}