import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/dtos/post_dto.dart';
import '../data/dtos/post_get_dto.dart';
import '../utils/rest_api.dart';
import '../data/dtos/post_user_dto.dart';
import '../data/dtos/onePostdetail_dto.dart';

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
    final userData = await RestAPI.fetchUserData();
    return PostUserDTO(
      loginId: userData.loginId,
      profileImage: userData.profileImage,
      nickName: userData.nickName,
    );
  }

  Future<List<PostGetDTO>> fetchPosts() async {
    try {
      final posts = await RestAPI.fetchPostGet();
      return posts;
    } catch (e) {
      print('Failed to fetch posts: $e');
      throw Exception('Failed to fetch posts: $e');
    }
  }

  Future<OnepostdetailDTO> fetchPostById(String postId) async {
    try {
      return await RestAPI.fetchPostById(postId);
    } catch (e) {
      print('Failed to fetch post by ID: $e');
      throw Exception('Failed to fetch post by ID: $e');
    }
  }
}
