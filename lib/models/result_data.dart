class ResultData {
  final String skintype;

  ResultData({
    required this.skintype,
  });

  factory ResultData.fromJson(Map<String, dynamic> json) {
    return ResultData(
      skintype: json['skintype'] ?? '', // 기본값 제공 (필요한 경우)
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'skintype': skintype,
    };
  }
}
