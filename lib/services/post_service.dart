import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/dtos/post_dto.dart';
import '../utils/rest_api.dart';
import '../data/dtos/post_user_dto.dart';

class PostService {
  Future<bool> createPost(PostDTO postDto) async {
    try {
      final success = await RestAPI.savePost(postDto.toJson());
      return success;
    } catch (e) {
      print('Failed to create post: $e');
      throw Exception('Failed to create post: $e');
    }
  }

  Future<PostUserDTO> fetchPostUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final loginId = prefs.getString('loginId');
    if (loginId == null) {
      throw Exception('No login ID found');
    }
    final userData = await RestAPI.fetchUserData(loginId);
    return PostUserDTO(
      loginId: userData.loginId,
      profileImage: userData.profileImage,
      nickName: userData.nickName,
    );
  }
}
