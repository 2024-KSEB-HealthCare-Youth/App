import '../data/dtos/result_detail_dto.dart';
import '../utils/rest_api.dart';

class ResultService {
  Future<ResultDetailDTO> fetchResultDetail(int userId) async {
    try {
      // ResultData를 가져옵니다.
      final resultData = await RestAPI.fetchResultData(userId);

      // 필요한 데이터를 추출하여 ResultDetailDTO를 생성합니다.
      final resultDetail = ResultDetailDTO(
        memberId: userId,
        details: resultData.resultDetails,
        resultImage: resultData.resultImage,
        faceImage: resultData.faceImage,
        resultDate: resultData.resultDate,
      );

      return resultDetail;
    } catch (e) {
      print('Fetch result details failed: $e');
      throw Exception('Fetch result details failed: $e');
    }
  }
}
