import 'package:freezed_annotation/freezed_annotation.dart';
import 'comment_data.dart';

part 'post_data.freezed.dart';
part 'post_data.g.dart';

enum Category { FREE }

@freezed
class PostData with _$PostData {
  const factory PostData({
    required String postId,
    required String title,
    required String content,
    required int likeCount,
    required Category category,
    required String profileImage,
    required String nickName,
    required List<CommentData> comments,
    required DateTime createdAt,
  }) = _PostData;

  factory PostData.fromJson(Map<String, dynamic> json) =>
      _$PostDataFromJson(json);
}
