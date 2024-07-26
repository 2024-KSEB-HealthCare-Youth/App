import 'package:flutter/material.dart';
import '../services/post_service.dart';
import 'post_detail_screen.dart';
import '../widgets/common_widgets.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({Key? key}) : super(key: key);

  @override
  _CommentsScreenState createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  final List<Map<String, dynamic>> _posts = PostService.getInitialPosts();
  final Set<int> _likedPosts = Set(); // Tracks liked posts
  final TextEditingController _postController = TextEditingController();

  void _showPostDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('새 글 작성하기'),
          content: TextField(
            controller: _postController,
            maxLines: 5,
            decoration: const InputDecoration(
              hintText: '내용을 입력하세요',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('취소'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_postController.text.isNotEmpty) {
                  setState(() {
                    _posts.insert(0, {
                      'name': 'New User',
                      'date': 'Today',
                      'comment': _postController.text,
                      'likes': 0,
                      'comments': [],
                    });
                  });
                  _postController.clear();
                  Navigator.of(context).pop();
                }
              },
              child: const Text('작성'),
            ),
          ],
        );
      },
    );
  }

  void _toggleLikePost(int index) {
    setState(() {
      if (_likedPosts.contains(index)) {
        _posts[index]['likes']--;
        _likedPosts.remove(index);
      } else {
        _posts[index]['likes']++;
        _likedPosts.add(index);
      }
    });
  }

  void _updatePost(int index, Map<String, dynamic> updatedPost) {
    setState(() {
      _posts[index] = updatedPost;
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
            buildCreatePostSection(_showPostDialog),
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
                                  _posts[index]['name'],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  _posts[index]['date'],
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  _posts[index]['comment'],
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            children: [
                              IconButton(
                                icon: Icon(
                                  _likedPosts.contains(index)
                                      ? Icons.thumb_up
                                      : Icons.thumb_up_alt_outlined,
                                  color: _likedPosts.contains(index)
                                      ? Colors.blue
                                      : Colors.grey,
                                ),
                                onPressed: () => _toggleLikePost(index),
                              ),
                              Text(_posts[index]['likes'].toString()),
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
