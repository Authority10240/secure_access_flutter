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

  ScannerPageState({this.model,this.description, this.engine, this.licenseNo, this.make, this.regNo, this.vin, this.year});
}

class ScannerPageInitState extends ScannerPageState  {}

class ScanQrState extends ScannerPageState{

  ScanQrState({super.model,super.description, super.engine, super.licenseNo, super.make, super.regNo, super.vin, super.year});
}