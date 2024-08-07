import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_data.freezed.dart';
part 'ai_data.g.dart';

enum SkinType { acne, wrinkle, atophy }

enum BasicType { OILY, DRY, COMBINATION }

@freezed
class AiData with _$AiData {
  const factory AiData({
    required List<String> cosNames,
    required List<String> cosPaths,
    required List<String> nutrNames,
    required List<String> nutrPaths,
    required BasicType simpleSkin,
    List<SkinType>? expertSkin,
    required String resultImage,
  }) = _AiData;

  factory AiData.fromJson(Map<String, dynamic> json) => _$AiDataFromJson(json);
}
