import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:secure_access/features/person_details/data/data_source/remote/person_details_remote_service.dart';
import 'package:secure_access/features/person_details/data/models/person_details_model_response/person_details_continue_clicked_model.dart';

const String visitation_details_collection = "visitations";

@Singleton(as: PersonDetailsRemoteService)
class PersonDetailsRemoteServiceImpl extends PersonDetailsRemoteService{

  PersonDetailsRemoteServiceImpl({required this.firebaseFirestore}){
    _visitationsRef = firebaseFirestore.collection(visitation_details_collection)
        .withConverter<PersonDetailsContinueClickedModel>(
        fromFirestore: (snapShot,_)=> PersonDetailsContinueClickedModel.fromJson(snapShot.data()!),
        toFirestore:(personDetailsContinueClickedModel, _ )=> personDetailsContinueClickedModel.toJson());
  }
  final FirebaseFirestore firebaseFirestore;
  late final CollectionReference _visitationsRef;

  @override
  Future<String> personDetailsContinueClicked({required PersonDetailsContinueClickedModel personDetailsContinueClickedModel})async {
   try{
     DocumentReference documentReference = await _visitationsRef.add(personDetailsContinueClickedModel);
     return documentReference.id;

   }catch(ex){
     rethrow;
   }
  }



}