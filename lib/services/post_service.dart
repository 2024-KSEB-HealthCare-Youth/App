import '../utils/rest_api.dart';
import '../data/dtos/post_dto.dart';
import '../data/dtos/onePostdetail_dto.dart';
import '../data/dtos/post_get_dto.dart';
import '../data/dtos/post_user_dto.dart';

class PostService {
  final RestAPI restAPI = RestAPI();

  Future<OnepostdetailDTO> fetchPostById(int postId) async {
    try {
      return await restAPI.fetchPostById(postId);
    } catch (e) {
      print('Failed to fetch post by ID: $e');
      throw Exception('Failed to fetch post by ID: $e');
    }
  }

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
      profileImage: userData.profileImage ?? '',
      nickName: userData.nickName ?? '',
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

  Future<void> deletePost(int postId) async {
    RestAPI.deletePost(postId);
  }
}
