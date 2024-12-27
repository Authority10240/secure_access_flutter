part of 'manual_vehicle_bloc.dart';
 @immutable
abstract class ManualVehiclePageEvent extends BaseEvent {}


class ManualVehicleContinueClickedEvent extends ManualVehiclePageEvent{
  final SecureAccessVisitationsVehicleModel manualVehicleContinueClickedModel;

  ManualVehicleContinueClickedEvent({required this.manualVehicleContinueClickedModel});
}
