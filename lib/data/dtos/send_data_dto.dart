import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_data_dto.freezed.dart';
part 'send_data_dto.g.dart';

enum skinType { ACNE, WRINKLE, ATOPHY }

@freezed
class SendDataDTO with _$SendDataDTO {
  const factory SendDataDTO({
    required String name,
    required String nickname,
    required String gender,
    required int age,
    String? email,
    required String phoneNumber,
    required String resultImage,
    String? resultDetails,
    required skinType advancedSkinType,
    required String basicSkinType,
  }) = _SendDataDTO;

  factory SendDataDTO.fromJson(Map<String, dynamic> json) =>
      _$SendDataDTOFromJson(json);
}
