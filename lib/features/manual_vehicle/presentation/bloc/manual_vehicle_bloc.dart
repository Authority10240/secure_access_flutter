import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secure_access/core/base_classes/base_bloc.dart';
import 'package:secure_access/core/base_classes/base_event.dart';
import 'package:secure_access/core/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:secure_access/features/manual_vehicle/domain/use_cases/manual_vehicle_usecase/manual_vehicle_continue_clicked_usecase.dart';
import 'package:secure_access_repository/models/secure_access_visitations_vehicle_model/secure_access_visitations_vehicle_model.dart';

part 'manual_vehicle_event.dart';
part 'manual_vehicle_state.dart';

@injectable
class ManualVehicleBloc
    extends BaseBloc<ManualVehiclePageEvent, ManualVehiclePageState> {
    ManualVehicleBloc({required this.manualVehicleContinueClickedUseCase}): super(ManualVehiclePageInitState()) {

        on<ManualVehicleContinueClickedEvent>((event,emit)=> _onManualVehicleContinueClickedEvent(event, emit));
    }

    final ManualVehicleContinueClickedUseCase manualVehicleContinueClickedUseCase;

    Future<void> _onManualVehicleContinueClickedEvent(
        ManualVehicleContinueClickedEvent event,
        Emitter<ManualVehiclePageState> emit
        )async{
        emit(ManualVehicleContinueClickedState()..dataState = DataState.loading);
        await manualVehicleContinueClickedUseCase.call(onSuccess: (model){

            emit(ManualVehicleContinueClickedState(referenceId: model)..dataState = DataState.success);
        }, onError:(error){
            emit(ManualVehicleContinueClickedState(errorMessage: error!.message, errorCode: error.errorCode)..dataState = DataState.error);
        },
        params: ManualVehicleContinueClickedUseCaseParams(manualVehicleContinueClickedModel: event.manualVehicleContinueClickedModel));

    }
} 
