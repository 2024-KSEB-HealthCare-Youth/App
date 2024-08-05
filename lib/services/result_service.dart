import 'package:dio/dio.dart';
import '../data/dtos/result_detail_dto.dart';
import '../utils/rest_api.dart';

class ResultService {
  Future<ResultDetailDTO> fetchResultDetail(int userId) async {
    try {
      // ResultData를 가져옵니다.
      final resultData = await RestAPI.fetchResultData(userId);

      // 필요한 데이터를 추출하여 ResultDetailDTO를 생성합니다.
      final resultDetail = ResultDetailDTO(
        resultDetails: resultData.resultDetails,
        resultImage: resultData.resultImage,
        faceImage: resultData.faceImage,
      );

      return resultDetail;
    } catch (e) {
      print('Fetch result details failed: $e');
      throw Exception('Fetch result details failed: $e');
    }
  }
}
