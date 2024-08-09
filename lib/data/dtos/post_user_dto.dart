import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_user_dto.freezed.dart';
part 'post_user_dto.g.dart';

@freezed
class PostUserDTO with _$PostUserDTO {
  factory PostUserDTO({
    String? profileImage,
    String? nickName,
  }) = _PostUserDTO;

  factory PostUserDTO.fromJson(Map<String, dynamic> json) =>
      _$PostUserDTOFromJson(json);
}
