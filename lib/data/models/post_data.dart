import 'package:freezed_annotation/freezed_annotation.dart';
import 'comment_data.dart';

part 'post_data.freezed.dart';
part 'post_data.g.dart';

enum Category { FREE }

@freezed
class postData with _$postData {
  const factory postData({
    required String postId,
    required String title,
    required String content,
    required int likeCount,
    required int commentCount,
    required int viewCount,
    required Category category,
    required String memberId,
    required String profileImage,
    required DateTime postDate,
    required String nickName,
    required List<CommentData> comments,
  }) = _postData;

  factory postData.fromJson(Map<String, dynamic> json) =>
      _$postDataFromJson(json);
}
