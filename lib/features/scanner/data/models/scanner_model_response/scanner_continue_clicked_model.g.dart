// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scanner_continue_clicked_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScannerContinueClickedModelImpl _$$ScannerContinueClickedModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ScannerContinueClickedModelImpl(
      engineNumber: json['engineNumber'] as String?,
      licenseNumber: json['licenseNumber'] as String?,
      regNumber: json['regNumber'] as String?,
      vinNumber: json['vinNumber'] as String?,
      expiryYear: json['expiryYear'] as String?,
      make: json['make'] as String?,
      model: json['model'] as String?,
      identificationNumber: json['identificationNumber'] as String?,
      date: json['date'] as String?,
      unitVisited: json['unitVisited'] as String?,
      id: json['id'] as String?,
      time: json['time'] as String?,
      year: json['year'] as String?,
      month: json['month'] as String?,
      outTime: json['outTime'] as String?,
      outDate: json['outDate'] as String?,
      timeStamp: DateTime.parse(json['timeStamp'] as String),
    );

Map<String, dynamic> _$$ScannerContinueClickedModelImplToJson(
        _$ScannerContinueClickedModelImpl instance) =>
    <String, dynamic>{
      'engineNumber': instance.engineNumber,
      'licenseNumber': instance.licenseNumber,
      'regNumber': instance.regNumber,
      'vinNumber': instance.vinNumber,
      'expiryYear': instance.expiryYear,
      'make': instance.make,
      'model': instance.model,
      'identificationNumber': instance.identificationNumber,
      'date': instance.date,
      'unitVisited': instance.unitVisited,
      'id': instance.id,
      'time': instance.time,
      'year': instance.year,
      'month': instance.month,
      'outTime': instance.outTime,
      'outDate': instance.outDate,
      'timeStamp': instance.timeStamp.toIso8601String(),
    };
