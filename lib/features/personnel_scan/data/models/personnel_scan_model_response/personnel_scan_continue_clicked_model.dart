import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'personnel_scan_continue_clicked_model.freezed.dart';
part 'personnel_scan_continue_clicked_model.g.dart';

@freezed
class PersonnelScanContinueClickedModel with _$PersonnelScanContinueClickedModel {
  const factory PersonnelScanContinueClickedModel({
    required String? identificationNumber,
    required String? identificationType,
    required String? firstName,
    required String? middleName,
    required String? lastName,
    required String? transportationType,
    required String? mobileNumber,
    required String? email,
    required DateTime? dateTime,
    required String? unitVisited
  }) = _PersonnelScanContinueClickedModel;

  factory PersonnelScanContinueClickedModel.fromJson(
          Map<String, Object?> json) =>
      _$PersonnelScanContinueClickedModelFromJson(json);
}
