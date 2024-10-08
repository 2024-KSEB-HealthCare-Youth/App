import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_get_dto.freezed.dart';
part 'comment_get_dto.g.dart';

@freezed
class CommentGetDTO with _$CommentGetDTO {
  const factory CommentGetDTO({
    required int postId,
    String? nickName,
    String? profileImage,
    required String content,
    required DateTime createdAt,
  }) = _CommentGetDTO;

  factory CommentGetDTO.fromJson(Map<String, dynamic> json) =>
      _$CommentGetDTOFromJson(json);
}
