import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_data.freezed.dart';
part 'ai_data.g.dart';

enum SkinType { ACNE, WRINKLES }

enum BaseType { COMBINATION, OILY, DRY }

@freezed
class AiData with _$AiData {
  const factory AiData({
    required List<String> cosNames,
    required List<String> cosPaths,
    required List<String> nutrNames,
    required List<String> nutrPaths,
    required BaseType simpleSkin,
    required List<SkinType>? expertSkin,
    required Map<String, double> probabilities,
  }) = _AiData;

  factory AiData.fromJson(Map<String, dynamic> json) => _$AiDataFromJson(json);
}
