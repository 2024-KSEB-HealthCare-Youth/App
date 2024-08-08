import 'package:freezed_annotation/freezed_annotation.dart';

part 'result_data.freezed.dart';
part 'result_data.g.dart';

@freezed
class ResultData with _$ResultData {
  const factory ResultData({
    String? skintype,
    required int resultId,
    required int memberId,
    required String resultImage,
    required String faceImage,
    required String resultDetails,
    required DateTime resultDate,
    required Map<String, double> probabilities,
  }) = _ResultData;

  factory ResultData.fromJson(Map<String, dynamic> json) =>
      _$ResultDataFromJson(json);
}
