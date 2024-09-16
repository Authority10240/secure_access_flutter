part of 'person_details_bloc.dart';
 @immutable
abstract class PersonDetailsPageEvent extends BaseEvent {}


class PersonDetailsContinueClickedEvent extends PersonDetailsPageEvent{

  final PersonDetailsContinueClickedModel personDetailsContinueClickedModel;

  PersonDetailsContinueClickedEvent({required this.personDetailsContinueClickedModel});
}