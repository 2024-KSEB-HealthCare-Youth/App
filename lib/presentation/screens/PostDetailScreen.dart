import 'package:flutter/material.dart';
import 'package:myapp/data/dtos/onePostdetail_dto.dart';
import 'package:provider/provider.dart';
import '../../data/dtos/comment_dto.dart';
import '../widgets/post_detail_header.dart';
import '../widgets/comment_section.dart';
import '../../services/comment_service.dart';
import '../../services/post_service.dart';

class PostDetailScreen extends StatefulWidget {
  final String postId;

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
  late String _nickname;
  late String _profileImage;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
    _postFuture = _fetchPostData();
  }

  Future<void> _fetchUserData() async {
    final userData = await PostService().fetchPostUserData();
    setState(() {
      _nickname = userData.nickName ?? 'Unknown User';
      _profileImage =
          userData.profileImage ?? 'https://via.placeholder.com/150';
    });
  }

  Future<OnepostdetailDTO> _fetchPostData() async {
    return await PostService().fetchPostById(widget.postId);
  }

  void _addComment() async {
    if (_commentController.text.isEmpty) return;
    final newComment = CommentDTO(
      nickName: _nickname,
      content: _commentController.text,
      profileImage: _profileImage,
    );
    try {
      await Provider.of<CommentService>(context, listen: false)
          .addComment(widget.postId,newComment);
      setState(() {
        _postFuture = _fetchPostData();
      });
    } catch (e) {
      // Handle error
      print('Failed to add comment: $e');
    }
    _commentController.clear();
  }

  void _toggleLikePost(OnepostdetailDTO post) async {
    try {
      await Provider.of<CommentService>(context, listen: false)
          .toggleLike(post.postId.toString());
      setState(() {
        _postFuture = _fetchPostData();
      });
    } catch (e) {
      // Handle error
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
            final isLiked =
                Provider.of<CommentService>(context).isPostLiked(widget.postId);
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  PostDetailHeader(post: post),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(
                          isLiked ? Icons.favorite : Icons.favorite_border,
                          color: isLiked ? Colors.red : Colors.grey,
                        ),
                        onPressed: () => _toggleLikePost(post),
                      ),
                      Text('${post.likeCount}'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  CommentSection(
                    comments: post.comments,
                    commentController: _commentController,
                    onAddComment: _addComment,
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
