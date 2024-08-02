import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:myapp/data/models/comment_data.dart';
import 'package:myapp/utils/rest_api.dart';
import '../data/dtos/comment_dto.dart';
import '../data/dtos/comment_get_dto.dart';
import '../data/models/post_data.dart';

class CommentService extends ChangeNotifier {
  final List<PostData> _posts = [];
  final Set<String> _likedPosts = Set<String>();
  final FlutterSecureStorage storage = FlutterSecureStorage();

  List<PostData> get posts => List.unmodifiable(_posts);

  void setPosts(List<PostData> posts) {
    _posts.clear();
    _posts.addAll(posts);
    notifyListeners();
  }

  void addPost(PostData post) {
    _posts.insert(0, post);
    notifyListeners();
  }

  Future<void> addComment(String postId, CommentDTO newComment) async {
    await RestAPI.addCommentToPost(postId, newComment);
    notifyListeners();
  }

  Future<void> fetchComments(String postId) async {
    final comments = await RestAPI.getComments(postId);
    final postIndex = _posts.indexWhere((post) => post.postId == postId);
    if (postIndex != -1) {
      _posts[postIndex].comments.clear();
      _posts[postIndex].comments.addAll(comments.map((comment) => CommentData(
        postId: postId,
        nickName: comment.nickName,
        createdAt: comment.createdAt,
        content: comment.content,
        profileImage: comment.profileImage,
      )));
      notifyListeners();
    } else {
      throw Exception('Post not found');
    }
  }

  Future<void> toggleLike(String postId) async {
    final token = await storage.read(key: 'access_token');
    if (token == null) {
      throw Exception('No access token found');
    }

    final postIndex = _posts.indexWhere((post) => post.postId == postId);
    if (postIndex != -1) {
      if (_likedPosts.contains(postId)) {
        _likedPosts.remove(postId);
        final updatedPost = _posts[postIndex].copyWith(
          likeCount: _posts[postIndex].likeCount - 1,
        );
        await RestAPI.removeLikeStatus(token); // DELETE 요청
        _posts[postIndex] = updatedPost;
      } else {
        _likedPosts.add(postId);
        final updatedPost = _posts[postIndex].copyWith(
          likeCount: _posts[postIndex].likeCount + 1,
        );
        await RestAPI.updateLikeStatus(token); // PUT 요청
        _posts[postIndex] = updatedPost;
      }
      notifyListeners();
    }
  }

  bool isPostLiked(String postId) {
    return _likedPosts.contains(postId);
  }
}
