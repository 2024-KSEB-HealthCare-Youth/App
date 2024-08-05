import 'package:shared_preferences/shared_preferences.dart';
import '../../data/models/past_data.dart';
import '../utils/rest_api.dart';
import '../data/dtos/recommend_dto.dart';
import '../data/dtos/my_page_dto.dart';
import '../data/dtos/edit_user_dto.dart';
import '../data/dtos/send_data_dto.dart';
import '../../data/models/ai_data.dart';

class UserService {

  Future<MyPageDTO> uploadImageAndFetchData(String imagePath) async {

    final RestAPI _restAPI = RestAPI();

    AiData aiData = await RestAPI.uploadImage(imagePath);
    SendDataDTO sendData = await _restAPI.sendDataToServer(aiData);
    final userData = await RestAPI.fetchUserData();

    // Convert SendDataDTO to MyPageDTO
    return MyPageDTO(
      age: sendData.age,
      name: sendData.name,
      gender: sendData.gender,
      email: sendData.email,
      phoneNumber: sendData.phoneNumber,
      resultPath: sendData.resultImage,
      resultDetails: sendData.resultDetails ?? '',
      simpleSkin: sendData.basicSkinType,
      profileImage: userData.profileImage,
      loginId: userData.loginId,
    );
  }

  // Fetch user data to be edited
  Future<EditUserDTO> fetchEditUserData() async {
    final userData = await RestAPI.fetchUserData();
    return EditUserDTO(
      name: userData.name,
      nickName: userData.nickName,
      email: userData.email,
      phoneNumber: userData.phoneNumber ?? '',
      age: userData.age,
      gender: userData.gender,
      profileImage: userData.profileImage,
    );
  }

  // Update user data
  Future<void> updateUserData(EditUserDTO updatedUser) async {
    try {
      await RestAPI.updateUserData(updatedUser.toJson());
    } catch (e) {
      print('Failed to update user data: $e');
      throw Exception('Failed to update user data: $e');
    }
  }

  Future<PastData> fetchPastData(String loginId) async {
    return await RestAPI.fetchPastData(loginId);
  }

  Future<RecommendDTO> fetchRecommendDTO() async {
    return await RestAPI.fetchRecommendData();
  }
}
