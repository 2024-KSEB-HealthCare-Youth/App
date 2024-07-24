import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_data.freezed.dart';
part 'ai_data.g.dart';

enum SkinType { acne, wrinkle, atophy }

@freezed
class AiData with _$AiData {
  const factory AiData({
    required List<String> cosNames,
    required List<String> cosPaths,
    required List<String> nutrNames,
    required List<String> nutPaths,
    required String simpleSkin,
    required List<SkinType> expertSkin,
    required String resultPath,
  }) = _AiData;

  factory AiData.fromJson(Map<String, dynamic> json) => _$AiDataFromJson(json);
}
