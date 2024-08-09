import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_user_dto.freezed.dart';
part 'edit_user_dto.g.dart';

@freezed
class EditUserDTO with _$EditUserDTO {
  factory EditUserDTO({
    String? name,
    String? nickName,
    String? email,
    String? phoneNumber,
    String? profileImage,
  }) = _EditUserDTO;

  factory EditUserDTO.fromJson(Map<String, dynamic> json) =>
      _$EditUserDTOFromJson(json);
}
