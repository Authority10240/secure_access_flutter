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
          date: json['date'] as String?,
          unit: json['unit'] as String?,
          time: json['time'] as String?,
          outTime: json['outTime'] as String?,
          outDate: json['outDate'] as String?,
          year: json['year'] as String?,
          month: json['month'] as String?,
          timeStamp: json['timeStamp'] == null
              ? null
              : DateTime.parse(json['timeStamp'] as String),
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
      'date': instance.date,
      'unit': instance.unit,
      'time': instance.time,
      'outTime': instance.outTime,
      'outDate': instance.outDate,
      'year': instance.year,
      'month': instance.month,
      'timeStamp': instance.timeStamp?.toIso8601String(),
    };
