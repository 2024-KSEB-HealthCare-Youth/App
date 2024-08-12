import 'package:myapp/data/dtos/send_data_dto.dart';

import '../../data/models/past_data.dart';
import '../data/models/ai_data.dart' as model;
import '../utils/rest_api.dart';
import '../data/dtos/recommend_dto.dart';
import '../data/dtos/my_page_dto.dart';
import '../data/dtos/edit_user_dto.dart';
import '../data/dtos/send_ai_dto.dart' as dto;

class UserService {
  Future<MyPageDTO> uploadImageAndFetchData(String imagePath) async {
    try {
      final aidata = await RestAPI.uploadImage(imagePath);
      final sendAiDTO = dataForm(aidata, imagePath);
      final data = await RestAPI.SendDataToServer(sendAiDTO);
      final userData = await RestAPI.fetchUserData();

      return _createMyPageDTO(data, userData);
    } catch (e) {
      print('Failed to upload image and fetch data: $e');
      throw Exception('Failed to upload image and fetch data: $e');
    }
  }

  Future<MyPageDTO> getMypagedata() async {
    try {
      final data = await RestAPI.fetchMypageData();
      final userData = await RestAPI.fetchUserData();

      return _createMyPageDTO(data, userData);
    } catch (e) {
      print('Failed to fetch MyPage data: $e');
      throw Exception('Failed to fetch MyPage data: $e');
    }
  }

  MyPageDTO _createMyPageDTO(dynamic data, dynamic userData) {
    return MyPageDTO(
      age: data.age ?? 0, // 기본값 설정
      name: data.name ?? 'Unknown', // 기본값 설정
      gender: data.gender ?? 'Unknown', // 기본값 설정
      email: data.email ?? 'No email provided', // 기본값 설정
      phoneNumber: data.phoneNumber ?? 'No phone number provided', // 기본값 설정
      resultDetails: data.resultDetails ?? 'error',
      simpleSkin: convertTypeToString(data.basicSkinType), // 기본값 설정
      profileImage: userData.profileImage ?? 'No image', // 기본값 설정
      loginId: userData.loginId ?? 'No ID', // 기본값 설정
      probabilities: data.probabilities ?? [], // 기본값 설정
    );
  }

  dto.SendAiDTO dataForm(model.AiData aiData, String imagePath) {
    return dto.SendAiDTO(
      resultDetails: 'your skintype is ${aiData.simpleSkin}',
      faceImage: imagePath,
      basicSkinType: _convertBasicType(aiData.simpleSkin),
      advancedSkinType: _convertSkinTypeList(aiData.expertSkin),
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
      default:
        throw Exception('Unknown BaseType: $Type');
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
      default:
        throw Exception('Unknown SkinType: $skinType');
    }
  }

  String convertTypeToString(Basic type) {
    switch (type) {
      case Basic.DRY:
        return 'DRY';
      case Basic.OILY:
        return 'OILY';
      case Basic.COMBINATION:
        return 'COMBINATION';
      default:
        throw Exception('Unknown Type: $type');
    }
  }

  Future<void> updateUserData(EditUserDTO updatedUser) async {
    try {
      await RestAPI.updateUserData(updatedUser);
    } catch (e) {
      print('Failed to update user data: $e');
      throw Exception('Failed to update user data: $e');
    }
  }

  Future<PastData> fetchPastData() async {
    try {
      return await RestAPI.fetchPastData();
    } catch (e) {
      print('Failed to fetch past data: $e');
      throw Exception('Failed to fetch past data: $e');
    }
  }

  Future<RecommendDTO> fetchRecommendDTO() async {
    try {
      return await RestAPI.fetchRecommendData();
    } catch (e) {
      print('Failed to fetch recommend data: $e');
      throw Exception('Failed to fetch recommend data: $e');
    }
  }
}
