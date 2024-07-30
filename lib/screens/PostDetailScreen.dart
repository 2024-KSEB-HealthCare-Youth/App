import 'package:flutter/material.dart';
import '../models/post_data.dart';
import '../models/comment_data.dart';
import '../utils/rest_api.dart';

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

  @override
  void initState() {
    super.initState();
    _currentPost = widget.post;
  }

  void _addComment() async {
    if (_commentController.text.isEmpty) return;
    final newComment = CommentData(
      name: 'New User',
      date: DateTime.now().toIso8601String(), // Proper date format
      comment: _commentController.text,
      likes: 0,
    );
    setState(() {
      _currentPost = _currentPost.copyWith(
        comments: [..._currentPost.comments, newComment],
        commentCount: _currentPost.commentCount + 1,
      );
    });
    widget.onPostUpdated(_currentPost); // Notify parent widget of the change
    await RestAPI.savePost(_currentPost.toJson()); // Save post to the server
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
    widget.onPostUpdated(_currentPost); // Notify parent widget of the change
    await RestAPI.savePost(_currentPost.toJson()); // Save post to the server
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
            Padding(
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
                          _currentPost.memberId,
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
                        Text(_currentPost.content),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _currentPost.comments.length,
                itemBuilder: (context, index) {
                  final comment = _currentPost.comments[index];
                  return Padding(
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
                                comment.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                comment.date,
                                style: TextStyle(
                                  color: Colors.grey[600],
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(comment.comment),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          children: [
                            IconButton(
                              icon: Icon(
                                _likedComments.contains(index)
                                    ? Icons.thumb_up
                                    : Icons.thumb_up_alt_outlined,
                                color: _likedComments.contains(index)
                                    ? Colors.blue
                                    : Colors.grey,
                              ),
                              onPressed: () => _toggleLikeComment(index),
                            ),
                            Text(comment.likes.toString()),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _commentController,
                    decoration: InputDecoration(
                      labelText: '댓글을 입력하세요',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _addComment,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
