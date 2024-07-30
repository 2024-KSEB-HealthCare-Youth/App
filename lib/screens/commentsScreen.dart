import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import the intl package
import '../screens/CreatePostScreen.dart';
import '../models/post_data.dart';
import '../models/comment_data.dart';
import '../models/user_data.dart';
import '../utils/rest_api.dart';
import '../screens/PostDetailScreen.dart';
import '../services/user_service.dart';
import '../widgets/common_widgets.dart'; // import the common_widgets

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({Key? key}) : super(key: key);

  @override
  _CommentsScreenState createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  List<postData> _posts = [];
  final Set<String> _likedPosts = Set(); // Tracks liked posts

  @override
  void initState() {
    super.initState();
    _fetchPosts();
  }

  Future<void> _fetchPosts() async {
    try {
      final posts = await RestAPI.fetchPosts();
      setState(() {
        _posts = posts;
      });
    } catch (e) {
      print('Failed to fetch posts: $e');
      // Handle error accordingly, e.g., show a message to the user
    }
  }

  Future<UserData?> _fetchUserData() async {
    try {
      final user = await UserService().fetchUserData();
      return user;
    } catch (e) {
      print('Failed to fetch user data: $e');
      return null;
    }
  }

  void _navigateToCreatePost() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => CreatePostScreen(onPostCreated: (newPost) {
        setState(() {
          _posts.insert(
              0, postData.fromJson(newPost)); // Insert the new post at the top
        });
      }),
    ));
  }

  void _toggleLikePost(String postId) {
    setState(() {
      final index = _posts.indexWhere((post) => post.postId == postId);
      if (index != -1) {
        final post = _posts[index];
        if (_likedPosts.contains(postId)) {
          _posts[index] = post.copyWith(likeCount: post.likeCount - 1);
          _likedPosts.remove(postId);
        } else {
          _posts[index] = post.copyWith(likeCount: post.likeCount + 1);
          _likedPosts.add(postId);
        }
        RestAPI.savePost(_posts[index].toJson());
      }
    });
  }

  void _updatePost(int index, postData updatedPost) {
    setState(() {
      _posts[index] = updatedPost;
      RestAPI.savePost(updatedPost.toJson());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'Youth'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            FutureBuilder<UserData?>(
              future: _fetchUserData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData) {
                  return const Center(child: Text('Failed to load user data'));
                } else {
                  final user = snapshot.data!;
                  return buildCreatePostSection(() {
                    _navigateToCreatePost();
                  }, user);
                }
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _posts.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PostDetailScreen(
                          post: _posts[index],
                          postIndex: index,
                          onPostUpdated: (updatedPost) {
                            _updatePost(index, updatedPost);
                          },
                        ),
                      ));
                    },
                    child: buildPostDetail(
                      _posts[index],
                      _likedPosts.contains(_posts[index].postId),
                          () {
                        _toggleLikePost(_posts[index].postId);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
