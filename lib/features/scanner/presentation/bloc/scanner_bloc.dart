import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secure_access/core/base_classes/base_bloc.dart';
import 'package:secure_access/core/base_classes/base_event.dart';
import 'package:secure_access/core/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:secure_access/features/person_details/presentation/person_details_page.dart';
import 'package:secure_access/features/scanner/data/models/scanner_model_response/scanner_continue_clicked_model.dart';
import 'package:secure_access/features/scanner/domain/use_cases/scanner_usecase/scanner_continue_clicked_usecase.dart';


part 'scanner_event.dart';
part 'scanner_state.dart';

@injectable
class ScannerBloc
    extends BaseBloc<ScannerPageEvent, ScannerPageState> {
    ScannerBloc({
      required this.scannerContinueClickedUseCase
}): super(ScannerPageInitState()) {

        on<ScanQrEvent>((event, emit)=> _onScanQrEvent(event, emit));
        on<ScannerContinueClickedEvent>((event, emit)=> _ScannerContinueClickedEvent(event, emit));

    }

    final ScannerContinueClickedUseCase scannerContinueClickedUseCase;

    Future<void> _ScannerContinueClickedEvent(
        ScannerContinueClickedEvent event,
        Emitter<ScannerPageState> emit
        )async{
      emit(ScannerContinueClickedState()..dataState = DataState.loading);
      await scannerContinueClickedUseCase.call(onSuccess: (model){
        emit(ScannerContinueClickedState(referenceId: model)..dataState = DataState.success);
      }, onError: (error){
        emit(ScannerContinueClickedState(
            errorCode: state.errorCode,
            errorMessage: error!.message)..dataState = DataState.error);
      },
      params: ScannerContinueClickedUseCaseParams(
          scannerContinueClickedModel: event.scannerContinueClickedModel));
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
