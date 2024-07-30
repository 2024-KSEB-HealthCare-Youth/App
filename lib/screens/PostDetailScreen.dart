import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/post_data.dart';
import '../models/comment_data.dart';
import '../utils/rest_api.dart';
import '../services/user_service.dart';
import '../widgets/post_detail_header.dart';
import '../widgets/comment_section.dart';

class PostDetailScreen extends StatefulWidget {
  final postData post;
  final int postIndex;
  final Function(postData) onPostUpdated;

  const PostDetailScreen({
    Key? key,
    required this.post,
    required this.postIndex,
    required this.onPostUpdated,
  }) : super(key: key);

  @override
  _PostDetailScreenState createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  final TextEditingController _commentController = TextEditingController();
  final Set<int> _likedComments = Set();
  late postData _currentPost;
  late String _nickname;
  late String _profileImage;

  @override
  void initState() {
    super.initState();
    _currentPost = widget.post;
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    final userData = await UserService().fetchUserData();
    setState(() {
      _nickname = userData?.nickName ?? 'Unknown User';
      _profileImage =
          userData?.profileImage ?? 'https://via.placeholder.com/150';
    });
  }

  void _addComment() async {
    if (_commentController.text.isEmpty) return;
    final newComment = CommentData(
      name: _nickname,
      date: DateTime.now().toIso8601String(),
      comment: _commentController.text,
      likes: 0,
      commentImage: _profileImage,
    );
    setState(() {
      _currentPost = _currentPost.copyWith(
        comments: [..._currentPost.comments, newComment],
        commentCount: _currentPost.commentCount + 1,
      );
    });
    widget.onPostUpdated(_currentPost);
    await RestAPI.savePost(_currentPost.toJson());
    _commentController.clear();
  }

  void _toggleLikeComment(int index) async {
    setState(() {
      final updatedComments = _currentPost.comments.toList();
      if (_likedComments.contains(index)) {
        updatedComments[index] = updatedComments[index].copyWith(
          likes: updatedComments[index].likes - 1,
        );
        _likedComments.remove(index);
      } else {
        updatedComments[index] = updatedComments[index].copyWith(
          likes: updatedComments[index].likes + 1,
        );
        _likedComments.add(index);
      }
      _currentPost = _currentPost.copyWith(comments: updatedComments);
    });
    widget.onPostUpdated(_currentPost);
    await RestAPI.savePost(_currentPost.toJson());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Youth',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: 'Pacifico',
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            PostDetailHeader(post: _currentPost),
            const SizedBox(height: 20),
            CommentSection(
              comments: _currentPost.comments,
              likedComments: _likedComments,
              commentController: _commentController,
              onToggleLikeComment: _toggleLikeComment,
              onAddComment: _addComment,
            ),
          ],
        ),
      ),
    );
  }
}
