import 'package:shared_preferences/shared_preferences.dart';
import '../../data/models/past_data.dart';
import '../utils/rest_api.dart';
import '../data/dtos/recommend_dto.dart';
import '../data/dtos/my_page_dto.dart';
import '../data/dtos/edit_user_dto.dart';

class UserService {
  Future<MyPageDTO> fetchMyPageDTO() async {
    final userData = await RestAPI.fetchUserData();
    final aiData = await RestAPI.fetchAiData();
    return MyPageDTO(
      age: userData.age,
      profileImage: userData.profileImage,
      name: userData.name,
      gender: userData.gender,
      email: userData.email,
      phoneNumber: userData.phoneNumber,
      loginId: userData.loginId,
      simpleSkin: aiData.simpleSkin,
      resultPath: aiData.resultPath,
    );
  }

  // Fetch user data to be edited
  Future<EditUserDTO> fetchEditUserData() async {
    final userData = await RestAPI.fetchUserData();
    return EditUserDTO(
      name: userData.name,
      nickName: userData.nickName,
      email: userData.email,
      phoneNumber: userData.phoneNumber,
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
    final userData = await RestAPI.fetchUserData();
    final aiData = await RestAPI.fetchAiData();
    return RecommendDTO(
      name: userData.name,
      simpleSkin: aiData.simpleSkin,
      expertSkin: aiData.expertSkin,
      cosNames: aiData.cosNames,
      cosPaths: aiData.cosPaths,
      nutrNames: aiData.nutrNames,
      nutrPaths: aiData.nutrPaths,
    );
  }
}
