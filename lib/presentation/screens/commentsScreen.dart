import 'package:flutter/material.dart';
import 'package:myapp/data/dtos/post_get_dto.dart';
import 'package:myapp/services/post_service.dart';
import '../../data/dtos/post_user_dto.dart';
import 'package:provider/provider.dart';
import '../screens/CreatePostScreen.dart';
import '../screens/PostDetailScreen.dart';
import '../widgets/post_card.dart';
import '../../services/like_service.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({Key? key}) : super(key: key);

  @override
  _CommentsScreenState createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  late Future<PostUserDTO> _userFuture;
  late Future<List<PostGetDTO>> _postsFuture;
  final PostService _postService = PostService();
  List<PostGetDTO> _posts = [];

  @override
  void initState() {
    super.initState();
    _userFuture = _postService.fetchPostUserData();
    _postsFuture = _fetchPosts();
  }

  Future<List<PostGetDTO>> _fetchPosts() async {
    final posts = await _postService.fetchPosts();
    setState(() {
      _posts = posts;
    });
    return posts;
  }

  Future<void> _refreshPosts() async {
    setState(() {
      _postsFuture = _fetchPosts();
    });
  }

  void _navigateToCreatePost() {
    Navigator.of(context)
        .push(
          MaterialPageRoute(
            builder: (context) => const CreatePostScreen(),
          ),
        )
        .then((_) => _refreshPosts());
  }

  void _navigateToPostDetail(int postId) {
    Navigator.of(context)
        .push(
          MaterialPageRoute(
            builder: (context) => PostDetailScreen(postId: postId),
          ),
        )
        .then((_) => _refreshPosts());
  }

  void _updateLikeCount(int postId, bool isLiked) {
    setState(() {
      _posts = _posts.map((post) {
        if (post.postId == postId) {
          final newLikeCount = (post.likeCount ?? 0) + (isLiked ? 1 : -1);
          return post.copyWith(
              likeCount: newLikeCount); // Assuming copyWith method exists
        }
        return post;
      }).toList();
    });
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
              user.profileImage ?? 'https://via.placeholder.com/150',
            ),
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
                  child: const Text('글 작성하기',
                      style: TextStyle(color: Colors.black54)),
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
      body: RefreshIndicator(
        onRefresh: _refreshPosts,
        child: Padding(
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
                    return const Center(
                        child: Text('Failed to load user data'));
                  } else {
                    final user = snapshot.data!;
                    return _buildCreatePostSection(user);
                  }
                },
              ),
              const SizedBox(height: 20),
              Expanded(
                child: FutureBuilder<List<PostGetDTO>>(
                  future: _postsFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text('No posts available'));
                    } else {
                      return ListView.builder(
                        itemCount: _posts.length,
                        itemBuilder: (context, index) {
                          final post = _posts[index];
                          return Consumer<LikeService>(
                            builder: (context, likeService, child) {
                              return PostCard(
                                post: post,
                                isLiked: likeService.isPostLiked(post.postId),
                                onLikePressed: () async {
                                  await likeService.toggleLike(
                                    post.postId,
                                    post.likeCount ?? 0,
                                  );
                                  // Update the like count locally
                                  _updateLikeCount(post.postId,
                                      likeService.isPostLiked(post.postId));
                                },
                                onTap: () {
                                  _navigateToPostDetail(post.postId);
                                },
                              );
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
      ),
    );
  }
}
