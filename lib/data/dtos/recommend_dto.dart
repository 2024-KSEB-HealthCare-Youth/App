import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/ai_data.dart';
import '../../data/models/user_data.dart';

part 'recommend_dto.freezed.dart';
part 'recommend_dto.g.dart';

@freezed
class RecommendDTO with _$RecommendDTO {
  const factory RecommendDTO({
    required String name,
    required List<String> cosNames,
    required List<String> cosPaths,
    required List<String> nutrNames,
    required List<String> nutrPaths,
    required String simpleSkin,
    required List<SkinType> expertSkin,
  }) = _RecommendDTO;

  factory RecommendDTO.fromJson(Map<String, dynamic> json) =>
      _$RecommendDTOFromJson(json);
}
