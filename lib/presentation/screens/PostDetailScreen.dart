import 'package:flutter/material.dart';
import 'package:myapp/data/dtos/onePostdetail_dto.dart';
import 'package:provider/provider.dart';
import '../../data/dtos/comment_dto.dart';
import '../widgets/post_detail_header.dart';
import '../widgets/comment_section.dart';
import '../../services/post_service.dart';
import '../../services/comment_service.dart';
import '../../services/like_service.dart';

class PostDetailScreen extends StatefulWidget {
  final int postId;

  const PostDetailScreen({
    Key? key,
    required this.postId,
  }) : super(key: key);

  @override
  _PostDetailScreenState createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  final TextEditingController _commentController = TextEditingController();
  late Future<OnepostdetailDTO> _postFuture;
  final PostService _postService = PostService();
  final CommentService _commentService = CommentService();

  @override
  void initState() {
    super.initState();
    _postFuture = _fetchPostData();
  }

  Future<OnepostdetailDTO> _fetchPostData() async {
    return await _postService.fetchPostById(widget.postId);
  }

  void _addComment(OnepostdetailDTO post) async {
    if (_commentController.text.isEmpty) return;
    final newComment = CommentDTO(
      nickName: post.nickName,
      content: _commentController.text,
      profileImage: post.profileImage ?? 'https://via.placeholder.com/150',
    );
    try {
      await _commentService.addComment(widget.postId, newComment);
      setState(() {
        _postFuture = _fetchPostData();
      });
    } catch (e) {
      print('Failed to add comment: $e');
    }
    _commentController.clear();
  }

  void _toggleLikePost(OnepostdetailDTO post) async {
    try {
      await Provider.of<LikeService>(context, listen: false)
          .toggleLike(post.postId, post.likeCount);
      setState(() {
        _postFuture = _fetchPostData();
      });
    } catch (e) {
      print('Failed to update like status: $e');
    }
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
      resizeToAvoidBottomInset:
          true, // Ensures the keyboard does not cause overflow
      body: FutureBuilder<OnepostdetailDTO>(
        future: _postFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('Failed to load post data'));
          } else {
            final post = snapshot.data!;
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PostDetailHeader(
                        post: post,
                        onLikePressed: () => _toggleLikePost(post),
                      ),
                      const SizedBox(height: 20),
                      CommentSection(
                        comments: post.comments,
                        commentController: _commentController,
                        onAddComment: () => _addComment(post),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
