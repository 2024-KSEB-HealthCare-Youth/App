
import 'package:freezed_annotation/freezed_annotation.dart';

import 'comment_dto.dart';

part 'onePostdetail_dto.g.dart';
part 'onePostdetail_dto.freezed.dart';

enum Category {FREE}

@freezed
class OnepostdetailDTO with _$OnepostdetailDTO{
  factory OnepostdetailDTO({
    required int postId,
    required String title,
    required int likeCount,
    required Category category,
    required String profileImage,
    required String nickName,
    required String content,
    required List<CommentDTO> comments,
    required DateTime createdAt,

})=_OnepostdetailDTO;
  factory OnepostdetailDTO.fromJson(Map<String, dynamic> json) =>
      _$OnepostdetailDTOFromJson(json);
}