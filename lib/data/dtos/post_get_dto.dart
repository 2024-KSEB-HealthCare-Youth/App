import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_get_dto.freezed.dart';
part 'post_get_dto.g.dart';

enum Category { FREE }

@freezed
class PostGetDTO with _$PostGetDTO {
  factory PostGetDTO({
    required int postId,
    required String title,
    required int? likeCount, // likeCount can be null
    required Category category,
    required String profileImage,
    required String nickName,
    required DateTime createdAt,
  }) = _PostGetDTO;

  factory PostGetDTO.fromJson(Map<String, dynamic> json) =>
      _$PostGetDTOFromJson(json);
}