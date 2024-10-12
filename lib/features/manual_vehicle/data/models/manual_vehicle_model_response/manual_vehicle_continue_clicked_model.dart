import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'manual_vehicle_continue_clicked_model.freezed.dart';
part 'manual_vehicle_continue_clicked_model.g.dart';

@freezed
class ManualVehicleContinueClickedModel with _$ManualVehicleContinueClickedModel {
  const factory ManualVehicleContinueClickedModel({
    required String? engineNumber,
    required String? licenseNumber,
    required String? regNumber,
    required String? vinNumber,
    required String? expiryYear,
    required String? make,
    required String? model,
    required String? identificationNumber,
    required String? color,

  }) = _ManualVehicleContinueClickedModel;

  factory ManualVehicleContinueClickedModel.fromJson(
          Map<String, Object?> json) =>
      _$ManualVehicleContinueClickedModelFromJson(json);
}
