import 'package:flutter/material.dart';
import '../screens/CreatePostScreen.dart';
import '../models/post_data.dart';
import '../models/user_data.dart';
import '../utils/rest_api.dart';
import '../screens/PostDetailScreen.dart';
import '../services/user_service.dart';
import '../widgets/common_widgets.dart';
import '../widgets/post_card.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({Key? key}) : super(key: key);

  @override
  _CommentsScreenState createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  List<postData> _posts = [];
  final Set<String> _likedPosts = Set();

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
          _posts.insert(0, postData.fromJson(newPost));
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
                  return PostCard(
                    post: _posts[index],
                    isLiked: _likedPosts.contains(_posts[index].postId),
                    onLikePressed: () {
                      _toggleLikePost(_posts[index].postId);
                    },
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
