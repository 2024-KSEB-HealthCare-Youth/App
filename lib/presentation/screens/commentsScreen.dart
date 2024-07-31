import 'package:flutter/material.dart';
import 'package:myapp/data/dtos/post_user_dto.dart';
import 'package:myapp/utils/rest_api.dart';
import 'package:provider/provider.dart';
import '../../data/models/post_data.dart';
import '../../services/comment_service.dart';
import '../../services/post_service.dart';
import '../screens/CreatePostScreen.dart';
import '../screens/PostDetailScreen.dart';
import '../widgets/post_card.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({Key? key}) : super(key: key);

  @override
  _CommentsScreenState createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  late Future<PostUserDTO> _userFuture;
  late Future<void> _postsFuture;

  @override
  void initState() {
    super.initState();
    _userFuture = PostService().fetchPostUserData();
    _postsFuture = _fetchPosts();
  }

  Future<void> _fetchPosts() async {
    try {
      final List<postData> posts = await RestAPI.fetchPosts();
      Provider.of<CommentService>(context, listen: false).setPosts(posts);
    } catch (e) {
      print('Failed to fetch posts: $e');
    }
  }

  void _navigateToCreatePost() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => CreatePostScreen(onPostCreated: (newPost) {
        Provider.of<CommentService>(context, listen: false)
            .addPost(postData.fromJson(newPost));
      }),
    ));
  }

  Widget _buildCreatePostSection(PostUserDTO user) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
                user.profileImage ?? 'https://via.placeholder.com/150'),
            radius: 25,
          ),
          const SizedBox(width: 10),
          Text(
            user.nickName ?? user.loginId,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: 100,
                child: ElevatedButton(
                  onPressed: _navigateToCreatePost,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[200],
                    foregroundColor: Colors.black54,
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 10.0),
                    textStyle: const TextStyle(fontSize: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: const Text(
                    '글 작성하기',
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final commentService = Provider.of<CommentService>(context);
    final posts = commentService.posts;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/main_page');
          },
          child: const Text(
            'Youth',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontFamily: 'Pacifico',
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            FutureBuilder<PostUserDTO>(
              future: _userFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData) {
                  return const Center(child: Text('Failed to load user data'));
                } else {
                  final user = snapshot.data!;
                  return _buildCreatePostSection(user);
                }
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              child: FutureBuilder<void>(
                future: _postsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    return ListView.builder(
                      itemCount: posts.length,
                      itemBuilder: (context, index) {
                        return PostCard(
                          post: posts[index],
                          isLiked:
                              commentService.isPostLiked(posts[index].postId),
                          onLikePressed: () {
                            commentService.toggleLike(posts[index].postId);
                          },
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PostDetailScreen(
                                post: posts[index],
                                postIndex: index,
                                onPostUpdated: (updatedPost) {
                                  commentService.setPosts([
                                    ...posts.sublist(0, index),
                                    updatedPost,
                                    ...posts.sublist(index + 1)
                                  ]);
                                },
                              ),
                            ));
                          },
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
