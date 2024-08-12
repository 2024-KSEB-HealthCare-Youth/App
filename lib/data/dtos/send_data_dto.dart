import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_data_dto.freezed.dart';
part 'send_data_dto.g.dart';

enum skinType { ACNE, WRINKLES }

enum Basic { DRY, OILY, COMBINATION }

@freezed
class SendDataDTO with _$SendDataDTO {
  const factory SendDataDTO({
    String? name,
    String? nickname,
    required String gender,
    required int age,
    String? email,
    required String phoneNumber,
    String? resultDetails,
    List<skinType>? advancedSkinType,
    required Basic basicSkinType,
    required Map<String, double> probabilities,
  }) = _SendDataDTO;

  factory SendDataDTO.fromJson(Map<String, dynamic> json) =>
      _$SendDataDTOFromJson(json);
}
