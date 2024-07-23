class ResultData {
  final String? skintype;
  final int resultId;
  final int memberId;
  final String resultImage;
  final String faceImage;
  final String resultDetails;
  final DateTime resultDate;

  ResultData({
    this.skintype,
    required this.resultId,
    required this.memberId,
    required this.resultImage,
    required this.faceImage,
    required this.resultDetails,
    required this.resultDate,
  });

  factory ResultData.fromJson(Map<String, dynamic> json) {
    return ResultData(
      skintype: json['skintype'],
      resultId: json['resultId'],
      memberId: json['memberId'],
      resultImage: json['resultImage'],
      faceImage: json['faceImage'],
      resultDetails: json['resultDetails'],
      resultDate: json['resultDate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'skintype': skintype,
      'resultId': resultId,
      'memberId': memberId,
      'resultImage': resultImage,
      'faceImage': faceImage,
      'resultDetails': resultDetails,
      'resultDate': resultDate,
    };
  }
}
