import 'package:secure_access/core/base_classes/base_bloc.dart';
import 'package:secure_access/core/base_classes/base_event.dart';
import 'package:secure_access/core/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'manual_vehicle_event.dart';
part 'manual_vehicle_state.dart';

@injectable
class ManualVehicleBloc
    extends BaseBloc<ManualVehiclePageEvent, ManualVehiclePageState> {
    ManualVehicleBloc(): super(ManualVehiclePageInitState()) {}
} 
