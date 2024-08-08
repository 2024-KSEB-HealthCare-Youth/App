import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_ai_dto.freezed.dart';
part 'send_ai_dto.g.dart';

enum skintype { ACNE, WRINKLES, ATOPHY }

enum type { DRY, OILY, COMBINATION }

@freezed
class SendAiDTO with _$SendAiDTO {
  const factory SendAiDTO({
    String? resultDetails,
    required String faceImage,
    required type basicSkinType,
    List<skintype>? advancedSkinType,
    required List<String> cosNames,
    required List<String> cosPaths,
    required List<String> nutrNames,
    required List<String> nutrPaths,
    required Map<String, double> probabilities,
  }) = _SendAiDTO;

  factory SendAiDTO.fromJson(Map<String, dynamic> json) =>
      _$SendAiDTOFromJson(json);
}
