import 'package:freezed_annotation/freezed_annotation.dart';

part 'result_detail_dto.freezed.dart';
part 'result_detail_dto.g.dart';

@freezed
class ResultDetailDTO with _$ResultDetailDTO {
  const factory ResultDetailDTO({
    required int memberId,
    required String resultImage,
    required String faceImage,
    String? details,
    required DateTime resultDate,
  }) = _ResultDetailDTO;

  factory ResultDetailDTO.fromJson(Map<String, dynamic> json) =>
      _$ResultDetailDTOFromJson(json);
}
