// services/comment_service.dart

import 'package:flutter/material.dart';

class CommentService extends ChangeNotifier {
  final List<Map<String, dynamic>> _posts = [
    {
      'id': '1',
      'name': 'Alyce Lambo',
      'date': '25/06/2020',
      'comment':
          'Really convenient and the points system helps benefit loyalty...',
      'likes': 10,
      'comments': [
        {
          'name': 'Brian C',
          'date': '25/06/2020',
          'comment': 'Great post!',
          'likes': 5,
        }
      ],
    },
    {
      'id': '2',
      'name': 'Gonela Solom',
      'date': '22/06/2020',
      'comment':
          'Been a life saver for keeping our sanity during the pandemic...',
      'likes': 10,
      'comments': [],
    },
    // More posts...
  ];

  final Set<String> _likedPosts = Set<String>();

  List<Map<String, dynamic>> get posts => _posts;

  void addComment(String commentText) {
    _posts.insert(0, {
      'id': (_posts.length + 1).toString(),
      'name': 'New User',
      'date': 'Today',
      'comment': commentText,
      'likes': 0,
      'comments': [],
    });
    notifyListeners();
  }

  void toggleLike(String postId) {
    final post = _posts.firstWhere((post) => post['id'] == postId);
    if (_likedPosts.contains(postId)) {
      _likedPosts.remove(postId);
      post['likes']--;
    } else {
      _likedPosts.add(postId);
      post['likes']++;
    }
    notifyListeners();
  }

  void addCommentToPost(int postIndex, Map<String, dynamic> comment) {
    final comments = _posts[postIndex]['comments'] as List;
    comments.add(comment);
    notifyListeners();
  }

  // Method to check if a post is liked
  bool isPostLiked(String postId) {
    return _likedPosts.contains(postId);
  }
}
