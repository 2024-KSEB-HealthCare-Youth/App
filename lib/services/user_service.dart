import '../../data/models/past_data.dart';
import '../data/models/ai_data.dart' as model;
import '../utils/rest_api.dart';
import '../data/dtos/recommend_dto.dart';
import '../data/dtos/my_page_dto.dart';
import '../data/dtos/edit_user_dto.dart';
import '../data/dtos/send_ai_dto.dart' as dto;

class UserService {
  Future<MyPageDTO> uploadImageAndFetchData(String imagePath) async {
    final aidata = await RestAPI.uploadImage(imagePath);
    final sendAiDTO = dataForm(aidata, imagePath);
    final data = await RestAPI.SendDataToServer(sendAiDTO);
    final userData = await RestAPI.fetchUserData();

    // Convert SendDataDTO to MyPageDTO
    return MyPageDTO(
      age: data.age,
      name: data.name,
      gender: data.gender,
      email: data.email,
      phoneNumber: data.phoneNumber,
      resultDetails: data.resultDetails ?? '',
      simpleSkin: data.basicSkinType.toString(),
      profileImage: userData.profileImage,
      loginId: userData.loginId,
      probabilities: data.probabilities,
    );
  }

  dto.SendAiDTO dataForm(model.AiData aiData, String imagePath) {
    return dto.SendAiDTO(
      resultDetails: '',
      faceImage: imagePath,
      basicSkinType: _convertBasicType(
          aiData.simpleSkin), // Example value, adjust as needed
      advancedSkinType:
          _convertSkinTypeList(aiData.expertSkin), // Example values
      cosNames: aiData.cosNames,
      cosPaths: aiData.cosPaths,
      nutrNames: aiData.nutrNames,
      nutrPaths: aiData.nutrPaths,
      probabilities: aiData.probabilities,
    );
  }

  dto.type _convertBasicType(model.BaseType Type) {
    switch (Type) {
      case model.BaseType.OILY:
        return dto.type.OILY;
      case model.BaseType.DRY:
        return dto.type.DRY;
      case model.BaseType.COMBINATION:
        return dto.type.COMBINATION;
    }
  }

  List<dto.skintype>? _convertSkinTypeList(List<model.SkinType>? skinTypes) {
    return skinTypes?.map((type) => _convertSkinType(type)).toList();
  }

  dto.skintype _convertSkinType(model.SkinType skinType) {
    switch (skinType) {
      case model.SkinType.ACNE:
        return dto.skintype.ACNE;
      case model.SkinType.WRINKLES:
        return dto.skintype.WRINKLES;
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
