import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_data.freezed.dart';
part 'ai_data.g.dart';

enum SkinType { acne, wrinkle, atophy }

extension SkinTypeExtension on SkinType {
  String toJson() {
    return toString().split('.').last.toUpperCase();
  }

  static SkinType fromJson(String json) {
    switch (json) {
      case 'ACNE':
        return SkinType.acne;
      case 'WRINKLE':
        return SkinType.wrinkle;
      case 'ATOPHY':
        return SkinType.atophy;
      default:
        throw ArgumentError('Unknown skin type: $json');
    }
  }
}

class SkinTypeConverter implements JsonConverter<SkinType, String> {
  const SkinTypeConverter();

  @override
  SkinType fromJson(String json) => SkinTypeExtension.fromJson(json);

  @override
  String toJson(SkinType object) => object.toJson();
}

class SkinTypeListConverter implements JsonConverter<List<SkinType>, List<String>> {
  const SkinTypeListConverter();

  @override
  List<SkinType> fromJson(List<String> json) =>
      json.map((e) => SkinTypeExtension.fromJson(e)).toList();

  @override
  List<String> toJson(List<SkinType> object) =>
      object.map((e) => e.toJson()).toList();
}

@freezed
class AiData with _$AiData {
  const factory AiData({
    required List<String> cosNames,
    required List<String> cosPaths,
    required List<String> nutrNames,
    required List<String> nutrPaths,
    required String simpleSkin,
    @SkinTypeListConverter() List<SkinType>? expertSkin,
    required String resultImage,
  }) = _AiData;

  factory AiData.fromJson(Map<String, dynamic> json) => _$AiDataFromJson(json);
}
