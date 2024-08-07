import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_dto.freezed.dart';
part 'ai_dto.g.dart';

enum SkinType { ACNE, WRINKLE, ATOPHY }

enum BaseType { OILY, DRY, COMBINATION }

@freezed
class AiDTO with _$AiDTO {
  const factory AiDTO({
    required String resultImage,
    required String resultDetails,
    required String faceImage,
    required BaseType basicSkinType,
    List<SkinType>? advancedSkinType,
    required List<String> cosNames,
    required List<String> cosPaths,
    required List<String> nutrNames,
    required List<String> nutrPaths,
  }) = _AiDTO;

  factory AiDTO.fromJson(Map<String, dynamic> json) => _$AiDTOFromJson(json);
}
