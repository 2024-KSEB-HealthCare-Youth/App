import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_dto.freezed.dart';
part 'comment_dto.g.dart';

@freezed
class CommentDTO with _$CommentDTO {
  const factory CommentDTO({
    String? nickName,
    String? profileImage,
    required String content,
  }) = _CommentDTO;

  factory CommentDTO.fromJson(Map<String, dynamic> json) =>
      _$CommentDTOFromJson(json);
}
