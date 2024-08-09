import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_page_dto.freezed.dart';
part 'my_page_dto.g.dart';

@freezed
class MyPageDTO with _$MyPageDTO {
  const factory MyPageDTO({
    String? profileImage,
    String? name,
    required String gender,
    required int age,
    String? email,
    required String phoneNumber,
    required String loginId,
    required String simpleSkin,
    String? resultDetails,
    required Map<String, double> probabilities,
  }) = _MyPageDTO;

  factory MyPageDTO.fromJson(Map<String, dynamic> json) =>
      _$MyPageDTOFromJson(json);
}
