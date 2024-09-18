// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_details_continue_clicked_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PersonDetailsContinueClickedModelImpl
    _$$PersonDetailsContinueClickedModelImplFromJson(
            Map<String, dynamic> json) =>
        _$PersonDetailsContinueClickedModelImpl(
          identificationNumber: json['identificationNumber'] as String?,
          identificationType: json['identificationType'] as String?,
          firstName: json['firstName'] as String?,
          middleName: json['middleName'] as String?,
          lastName: json['lastName'] as String?,
          transportationType: json['transportationType'] as String?,
          mobileNumber: json['mobileNumber'] as String?,
          email: json['email'] as String?,
          dateTime: json['dateTime'] == null
              ? null
              : DateTime.parse(json['dateTime'] as String),
          unitVisited: json['unitVisited'] as String?,
        );

Map<String, dynamic> _$$PersonDetailsContinueClickedModelImplToJson(
        _$PersonDetailsContinueClickedModelImpl instance) =>
    <String, dynamic>{
      'identificationNumber': instance.identificationNumber,
      'identificationType': instance.identificationType,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'transportationType': instance.transportationType,
      'mobileNumber': instance.mobileNumber,
      'email': instance.email,
      'dateTime': instance.dateTime?.toIso8601String(),
      'unitVisited': instance.unitVisited,
    };
