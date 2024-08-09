import 'package:freezed_annotation/freezed_annotation.dart';
import '../dtos/comment_get_dto.dart';

part 'onePostdetail_dto.g.dart';
part 'onePostdetail_dto.freezed.dart';

enum Category { FREE }

@freezed
class OnepostdetailDTO with _$OnepostdetailDTO {
  const factory OnepostdetailDTO({
    required int postId,
    required String title,
    required int likeCount,
    required Category category,
    String? profileImage,
    String? nickName,
    required String content,
    required List<CommentGetDTO> comments,
    required DateTime createdAt,
  }) = _OnepostdetailDTO;

  factory OnepostdetailDTO.fromJson(Map<String, dynamic> json) =>
      _$OnepostdetailDTOFromJson(json);
}

// Custom JSON serialization for Category enum
Category _categoryFromJson(String value) {
  return Category.values
      .firstWhere((e) => e.toString().split('.').last == value);
}

String _categoryToJson(Category category) {
  return category.toString().split('.').last;
}
