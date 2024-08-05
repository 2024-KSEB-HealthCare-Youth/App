import 'package:freezed_annotation/freezed_annotation.dart';

part 'past_data.freezed.dart';
part 'past_data.g.dart';

@freezed
class PastData with _$PastData {
  const factory PastData({
    required List<int> resultId,
    required List<DateTime> resultDate,
  }) = _PastData;

  factory PastData.fromJson(Map<String, dynamic> json) =>
      _$PastDataFromJson(json);
}
