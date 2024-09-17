import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'person_details_continue_clicked_model.freezed.dart';
part 'person_details_continue_clicked_model.g.dart';

@freezed
class PersonDetailsContinueClickedModel with _$PersonDetailsContinueClickedModel {
  const factory PersonDetailsContinueClickedModel({
    required String? identificationNumber,
    required String? identificationType,
    required String? firstName,
    required String? middleName,
    required String? lastName,
    required String? transportationType,
    required String? mobileNumber,
    required String? email,
    required DateTime? dateTime
  }) = _PersonDetailsContinueClickedModel;

  factory PersonDetailsContinueClickedModel.fromJson(
          Map<String, Object?> json) =>
      _$PersonDetailsContinueClickedModelFromJson(json);
}
