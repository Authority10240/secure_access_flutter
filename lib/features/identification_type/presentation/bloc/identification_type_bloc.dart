import 'package:secure_access/core/base_classes/base_bloc.dart';
import 'package:secure_access/core/base_classes/base_event.dart';
import 'package:secure_access/core/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'identification_type_event.dart';
part 'identification_type_state.dart';

@injectable
class IdentificationTypeBloc
    extends BaseBloc<IdentificationTypePageEvent, IdentificationTypePageState> {
    IdentificationTypeBloc(): super(IdentificationTypePageInitState()) {}
} 
