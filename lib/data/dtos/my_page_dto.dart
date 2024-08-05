import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/user_data.dart';
import '../../data/models/ai_data.dart';

part 'my_page_dto.freezed.dart';
part 'my_page_dto.g.dart';

@freezed
class MyPageDTO with _$MyPageDTO {
  const factory MyPageDTO({
    String? profileImage,
    required String name,
    required String gender,
    required int age,
    String? email,
    required String phoneNumber,
    required String loginId,
    required String simpleSkin,
    required String resultPath,
    required String resultDetails,
  }) = _MyPageDTO;

  factory MyPageDTO.fromJson(Map<String, dynamic> json) =>
      _$MyPageDTOFromJson(json);
}
