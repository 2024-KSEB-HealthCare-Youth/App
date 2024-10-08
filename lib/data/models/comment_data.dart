import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_data.freezed.dart';
part 'comment_data.g.dart';

@freezed
class CommentData with _$CommentData {
  const factory CommentData({
    required String postId,
    required String nickName,
    String? profileImage,
    required String content,
    required DateTime createdAt,
  }) = _CommentData;

  factory CommentData.fromJson(Map<String, dynamic> json) =>
      _$CommentDataFromJson(json);
}
