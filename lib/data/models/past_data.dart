import 'package:freezed_annotation/freezed_annotation.dart';

part 'past_data.freezed.dart';
part 'past_data.g.dart';

@freezed
class ResultItem with _$ResultItem {
  const factory ResultItem({
    required int resultId,
    required DateTime resultDate,
  }) = _ResultItem;

  factory ResultItem.fromJson(Map<String, dynamic> json) =>
      _$ResultItemFromJson(json);
}

@freezed
class PastData with _$PastData {
  const factory PastData({
    required List<ResultItem> results,
  }) = _PastData;

  factory PastData.fromJson(Map<String, dynamic> json) =>
      _$PastDataFromJson(json);
}
