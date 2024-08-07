import 'package:shared_preferences/shared_preferences.dart';
import '../../data/models/past_data.dart';
import '../utils/rest_api.dart';
import '../data/dtos/recommend_dto.dart';
import '../data/dtos/my_page_dto.dart';
import '../data/dtos/edit_user_dto.dart';
import '../data/dtos/send_data_dto.dart';
import '../../data/models/ai_data.dart' as model;
import '../data/dtos/ai_dto.dart' as dto;

class UserService {
  Future<MyPageDTO> uploadImageAndFetchData(String imagePath) async {
    model.AiData aiData = await RestAPI.uploadImage(imagePath);
    SendDataDTO sendData = await sendDataToServer(aiData, imagePath);
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

  Future<SendDataDTO> sendDataToServer(model.AiData aiData, String imagePath) {
    final _RestAPI = RestAPI();
    dto.AiDTO data = dto.AiDTO(
      resultImage: aiData.resultImage,
      resultDetails: '',
      faceImage: imagePath,
      basicSkinType: _convertBasicType(aiData.simpleSkin),
      advancedSkinType: _convertSkinTypeList(aiData.expertSkin),
      cosNames: aiData.cosNames,
      cosPaths: aiData.cosPaths,
      nutrNames: aiData.nutrNames,
      nutrPaths: aiData.nutrPaths,
    );
    return _RestAPI.sendDataToServer(data);
  }

  List<dto.SkinType>? _convertSkinTypeList(List<model.SkinType>? skinTypes) {
    return skinTypes?.map((type) => _convertSkinType(type)).toList();
  }

  dto.SkinType _convertSkinType(model.SkinType skinType) {
    switch (skinType) {
      case model.SkinType.acne:
        return dto.SkinType.ACNE;
      case model.SkinType.wrinkle:
        return dto.SkinType.WRINKLE;
      case model.SkinType.atophy:
        return dto.SkinType.ATOPHY;
    }
  }

  dto.BaseType _convertBasicType(model.BasicType Type) {
    switch (Type) {
      case model.BasicType.OILY:
        return dto.BaseType.OILY;
      case model.BasicType.DRY:
        return dto.BaseType.DRY;
      case model.BasicType.COMBINATION:
        return dto.BaseType.COMBINATION;
    }
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

  Future<PastData> fetchPastData() async {
    return await RestAPI.fetchPastData();
  }

  Future<RecommendDTO> fetchRecommendDTO() async {
    return await RestAPI.fetchRecommendData();
  }
}
