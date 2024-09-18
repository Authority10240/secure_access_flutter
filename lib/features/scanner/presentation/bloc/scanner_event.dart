part of 'scanner_bloc.dart';
 @immutable
abstract class ScannerPageEvent extends BaseEvent {}


class ScanQrEvent extends ScannerPageEvent{

  final String qrCode;


  ScanQrEvent({required this.qrCode});

}

class ScannerContinueClickedEvent extends ScannerPageEvent{

   final ScannerContinueClickedModel scannerContinueClickedModel;


   ScannerContinueClickedEvent({required this.scannerContinueClickedModel});
}