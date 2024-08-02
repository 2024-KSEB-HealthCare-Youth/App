import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_user_dto.freezed.dart';
part 'edit_user_dto.g.dart';

@freezed
class EditUserDTO with _$EditUserDTO {
  factory EditUserDTO({
    required String name,
    String? nickName,
    String? email,
    required String phoneNumber,
    required int age,
    required String gender,
    String? profileImage,
  }) = _EditUserDTO;

  factory EditUserDTO.fromJson(Map<String, dynamic> json) =>
      _$EditUserDTOFromJson(json);
}
