import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_data.freezed.dart';
part 'comment_data.g.dart';

@freezed
class CommentData with _$CommentData {
  const factory CommentData({
    required String name,
    required String date,
    required String comment,
    required int likes,
  }) = _CommentData;

  factory CommentData.fromJson(Map<String, dynamic> json) =>
      _$CommentDataFromJson(json);
}
