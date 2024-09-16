import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secure_access/core/base_classes/base_bloc.dart';
import 'package:secure_access/core/base_classes/base_event.dart';
import 'package:secure_access/core/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:secure_access/features/person_details/presentation/person_details_page.dart';


part 'personnel_scan_event.dart';
part 'personnel_scan_state.dart';

@injectable
class PersonnelScanBloc
    extends BaseBloc<PersonnelScanPageEvent, PersonnelScanPageState> {
    PersonnelScanBloc(): super(PersonnelScanPageInitState()) {

        on<ScanQrEvent>((event, emit)=> _onScanQrEvent(event, emit));
    }

    Future<void> _onScanQrEvent(
        ScanQrEvent event,
        Emitter<PersonnelScanPageState> emit
        )async{
        emit(ScanQrState()..dataState = DataState.loading);


        try {
            if((event.identificationType == IdentificationType.id && event.qrCode.length == 13)
            || (event.identificationType == IdentificationType.passport && event.qrCode.length==7)) {
                emit(ScanQrState(
                    idNUmber: event.qrCode
                )
                    ..dataState = DataState.success);
            }else{
                emit(ScanQrState(errorMessage: state.errorMessage, errorCode: "001")..dataState = DataState.error);
            }
        }catch(ex){
            emit(ScanQrState(errorMessage: ex.toString(), errorCode: "001")..dataState = DataState.error);
        }
    }
} 
