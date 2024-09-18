part of 'manual_vehicle_bloc.dart';
@immutable
abstract class ManualVehiclePageState extends BaseState {

  ManualVehiclePageState({super.errorCode, super.errorMessage});
}

class ManualVehiclePageInitState extends ManualVehiclePageState  {}

class ManualVehicleContinueClickedState extends ManualVehiclePageState{

  String? referenceId;

  ManualVehicleContinueClickedState({super.errorCode, super.errorMessage, this.referenceId});
}