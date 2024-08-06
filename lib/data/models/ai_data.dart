import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_data.freezed.dart';
part 'ai_data.g.dart';

enum SkinType { acne, wrinkle, atophy }

@freezed
class AiData with _$AiData {
  const factory AiData({
    required List<String> cosNames,
    required List<String> cosPaths,
    required List<SkinType> expertSkin,
    required List<String> nutrNames,
    required List<String> nutrPaths,
    required String resultImage,
    required String simpleSkin,
  }) = _AiData;

  factory AiData.fromJson(Map<String, dynamic> json) => _$AiDataFromJson(json);
}
