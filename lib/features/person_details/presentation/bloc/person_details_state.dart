part of 'person_details_bloc.dart';
@immutable
abstract class PersonDetailsPageState extends BaseState {

  PersonDetailsPageState({super.errorCode, super.errorMessage});
}

class PersonDetailsPageInitState extends PersonDetailsPageState  {}

class PersonalDetailsContinueClickedState extends PersonDetailsPageState{

  final String? referenceId;
  PersonalDetailsContinueClickedState({this.referenceId,super.errorCode, super.errorMessage});
}