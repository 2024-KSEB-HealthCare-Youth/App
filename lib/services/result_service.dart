import '../data/dtos/result_detail_dto.dart';
import '../utils/rest_api.dart';

class ResultService {
  Future<ResultDetailDTO> fetchResultDetail(int userId) async {
    // ResultData를 가져옵니다.
    final resultData = await RestAPI.fetchResultData(userId);

    // 필요한 데이터를 추출하여 ResultDetailDTO를 생성합니다.

    return resultData;
  }
}
