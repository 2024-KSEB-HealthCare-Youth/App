import 'package:flutter/material.dart';
import '../screens/CreatePostScreen.dart';
import '../models/post_data.dart';
import '../models/comment_data.dart';
import '../utils/rest_api.dart';
import '../screens/PostDetailScreen.dart';

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
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
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
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundImage:
                        NetworkImage('https://via.placeholder.com/150'),
                    radius: 25,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: _navigateToCreatePost,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            backgroundImage:
                                NetworkImage('https://via.placeholder.com/150'),
                            radius: 20,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _posts[index].memberId,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '25/06/2020', // Example date
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  _posts[index].title,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  _posts[index].content,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  '댓글 ${_posts[index].commentCount}개',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            children: [
                              IconButton(
                                icon: Icon(
                                  _likedPosts.contains(_posts[index].postId)
                                      ? Icons.thumb_up
                                      : Icons.thumb_up_alt_outlined,
                                  color:
                                      _likedPosts.contains(_posts[index].postId)
                                          ? Colors.blue
                                          : Colors.grey,
                                ),
                                onPressed: () =>
                                    _toggleLikePost(_posts[index].postId),
                              ),
                              Text(_posts[index].likeCount.toString()),
                            ],
                          ),
                        ],
                      ),
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
