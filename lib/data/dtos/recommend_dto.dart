import 'package:freezed_annotation/freezed_annotation.dart';

part 'recommend_dto.freezed.dart';
part 'recommend_dto.g.dart';

enum SkinType { ACNE, WRINKLES }

enum SkinConditionType { DRY, OILY, COMBINATION } // Renamed from `Type`

@freezed
class RecommendDTO with _$RecommendDTO {
  const factory RecommendDTO({
    String? name,
    required SkinConditionType
        basicSkinType, // Updated to use the new enum name
    required List<SkinType>? advancedSkinType,
    required List<String> cosNames,
    required List<String> cosPaths,
    required List<String> nutrNames,
    required List<String> nutrPaths,
  }) = _RecommendDTO;

  factory RecommendDTO.fromJson(Map<String, dynamic> json) =>
      _$RecommendDTOFromJson(json);
}
