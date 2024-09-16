import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secure_access/core/base_classes/base_bloc.dart';
import 'package:secure_access/core/base_classes/base_event.dart';
import 'package:secure_access/core/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:secure_access/features/person_details/presentation/person_details_page.dart';


part 'scanner_event.dart';
part 'scanner_state.dart';

@injectable
class ScannerBloc
    extends BaseBloc<ScannerPageEvent, ScannerPageState> {
    ScannerBloc(): super(ScannerPageInitState()) {

        on<ScanQrEvent>((event, emit)=> _onScanQrEvent(event, emit));
    }

    Future<void> _onScanQrEvent(
        ScanQrEvent event,
        Emitter<ScannerPageState> emit
        )async{
        emit(ScanQrState()..dataState = DataState.loading);
        List<String> qrdata = event.qrCode.split('%');
        try {
          emit(ScanQrState(
            description: qrdata.elementAt(8),
            engine: qrdata.elementAt(13),
            licenseNo: qrdata.elementAt(6),
            make: qrdata.elementAt(9),
            model: qrdata.elementAt(10),
            regNo: qrdata.elementAt(7),
            vin: qrdata.elementAt(12),
            year: qrdata.elementAt(14),
          )
            ..dataState = DataState.success);
        }catch(ex){
        emit(ScanQrState(errorMessage: ex.toString(), errorCode: "001")..dataState = DataState.error);
      }
    }
} 
