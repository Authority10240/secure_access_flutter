import 'package:secure_access/core/base_classes/base_bloc.dart';
import 'package:secure_access/core/base_classes/base_event.dart';
import 'package:secure_access/core/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:secure_access/features/person_details/data/models/person_details_model_response/person_details_continue_clicked_model.dart';

part 'person_details_event.dart';
part 'person_details_state.dart';

@injectable
class PersonDetailsBloc
    extends BaseBloc<PersonDetailsPageEvent, PersonDetailsPageState> {
    PersonDetailsBloc(): super(PersonDetailsPageInitState()) {}
} 
