import 'package:flutter/material.dart';
import '../models/comment_data.dart';
import '../models/post_data.dart';

class CommentService extends ChangeNotifier {
  final List<postData> _posts = [];
  final Set<String> _likedPosts = Set<String>();

  List<postData> get posts => List.unmodifiable(_posts);

  void setPosts(List<postData> posts) {
    _posts.clear();
    _posts.addAll(posts);
    notifyListeners();
  }

  void addPost(postData post) {
    _posts.insert(0, post);
    notifyListeners();
  }

  void addComment(String postId, CommentData comment) {
    final postIndex = _posts.indexWhere((post) => post.postId == postId);
    if (postIndex != -1) {
      _posts[postIndex] = _posts[postIndex].copyWith(
        comments: List.from(_posts[postIndex].comments)..add(comment),
        commentCount: _posts[postIndex].commentCount + 1,
      );
      notifyListeners();
    }
  }

  void toggleLike(String postId) {
    final postIndex = _posts.indexWhere((post) => post.postId == postId);
    if (postIndex != -1) {
      if (_likedPosts.contains(postId)) {
        _likedPosts.remove(postId);
        _posts[postIndex] = _posts[postIndex].copyWith(
          likeCount: _posts[postIndex].likeCount - 1,
        );
      } else {
        _likedPosts.add(postId);
        _posts[postIndex] = _posts[postIndex].copyWith(
          likeCount: _posts[postIndex].likeCount + 1,
        );
      }
      notifyListeners();
    }
  }

  bool isPostLiked(String postId) {
    return _likedPosts.contains(postId);
  }
}
