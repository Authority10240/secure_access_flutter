import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secure_access/core/base_classes/base_bloc.dart';
import 'package:secure_access/core/base_classes/base_event.dart';
import 'package:secure_access/core/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:secure_access/features/person_details/data/models/person_details_model_response/person_details_continue_clicked_model.dart';
import 'package:secure_access/features/person_details/domain/use_cases/person_details_usecase/person_details_continue_clicked_usecase.dart';

part 'person_details_event.dart';
part 'person_details_state.dart';

@injectable
class PersonDetailsBloc
    extends BaseBloc<PersonDetailsPageEvent, PersonDetailsPageState> {
    PersonDetailsBloc({required this.personDetailsContinueClickedUseCase}): super(PersonDetailsPageInitState()) {

        on<PersonDetailsContinueClickedEvent>((event, emit)=> _personDetailsContinueClickedEvent(event,emit));
    }

    final PersonDetailsContinueClickedUseCase personDetailsContinueClickedUseCase;

    Future<void> _personDetailsContinueClickedEvent(
        PersonDetailsContinueClickedEvent event,
        Emitter<PersonDetailsPageState> emit
        )async{
        emit(PersonalDetailsContinueClickedState()..dataState = DataState.loading);
        await personDetailsContinueClickedUseCase.call(
            onSuccess: (model) {
                emit(PersonalDetailsContinueClickedState(referenceId:  model)..dataState = DataState.success);
            }
        , onError: (error){
            emit(PersonalDetailsContinueClickedState(errorCode: error!.errorCode, errorMessage:  error.message)..dataState = DataState.error);
            },
        params: PersonDetailsContinueClickedUseCaseParams(personDetailsContinueClickedModel: event.personDetailsContinueClickedModel));
    }
} 
