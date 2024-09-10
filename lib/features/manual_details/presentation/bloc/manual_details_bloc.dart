import 'package:secure_access/core/base_classes/base_bloc.dart';
import 'package:secure_access/core/base_classes/base_event.dart';
import 'package:secure_access/core/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'manual_details_event.dart';
part 'manual_details_state.dart';

@injectable
class ManualDetailsBloc
    extends BaseBloc<ManualDetailsPageEvent, ManualDetailsPageState> {
    ManualDetailsBloc(): super(ManualDetailsPageInitState()) {}
} 
