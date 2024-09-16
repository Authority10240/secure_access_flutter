part of 'personnel_scan_bloc.dart';
 @immutable
abstract class PersonnelScanPageEvent extends BaseEvent {}

class ScanQrEvent extends PersonnelScanPageEvent{

 final String qrCode;
 final IdentificationType identificationType;

 ScanQrEvent({required this.qrCode, required this.identificationType});
}