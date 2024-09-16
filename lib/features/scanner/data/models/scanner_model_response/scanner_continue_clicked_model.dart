
import 'package:freezed_annotation/freezed_annotation.dart';

part 'scanner_continue_clicked_model.freezed.dart';
part 'scanner_continue_clicked_model.g.dart';

@freezed
class ScannerContinueClickedModel with _$ScannerContinueClickedModel {
  const factory ScannerContinueClickedModel({
    required String? engineNumber,
    required String? licenseNumber,
    required String? regNumber,
    required String? vinNumber,
    required String? expiryYear,
    required String? make,
    required String? model,
    required String? identificationNumber
  }) = _ScannerContinueClickedModel;

  factory ScannerContinueClickedModel.fromJson(
          Map<String, Object?> json) =>
      _$ScannerContinueClickedModelFromJson(json);
}
