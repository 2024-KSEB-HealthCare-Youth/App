import 'package:flutter/material.dart';
import '../widgets/common_widgets.dart';
import 'new_post_screen.dart'; // Import the new screen

class PostDetailScreen extends StatefulWidget {
  final Map<String, dynamic> post;
  final int postIndex;
  final Function(Map<String, dynamic>) onPostUpdated;

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

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  void _addComment() {
    if (_commentController.text.isEmpty) return;
    final newComment = {
      'name': 'New User',
      'date': 'Today',
      'comment': _commentController.text,
      'likes': 0,
    };
    setState(() {
      widget.post['comments'].add(newComment);
    });
    widget.onPostUpdated(widget.post); // Notify parent widget of the change
    _commentController.clear();
  }

  void _toggleLikeComment(int index) {
    setState(() {
      if (_likedComments.contains(index)) {
        widget.post['comments'][index]['likes']--;
        _likedComments.remove(index);
      } else {
        widget.post['comments'][index]['likes']++;
        _likedComments.add(index);
      }
    });
    widget.onPostUpdated(widget.post); // Notify parent widget of the change
  }

  void _navigateToNewPostScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NewPostScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'Youth'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            buildPostDetail(widget.post),
            const SizedBox(height: 20),
            // Create Post Section
            GestureDetector(
              onTap: _navigateToNewPostScreen,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
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
                    const Text(
                      '글 작성하기',
                      style: TextStyle(color: Colors.black54, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: widget.post['comments'].length,
                itemBuilder: (context, index) {
                  final comment = widget.post['comments'][index];
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
                                comment['name'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                comment['date'],
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                comment['comment'],
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
                                _likedComments.contains(index)
                                    ? Icons.thumb_up
                                    : Icons.thumb_up_alt_outlined,
                                color: _likedComments.contains(index)
                                    ? Colors.blue
                                    : Colors.grey,
                              ),
                              onPressed: () => _toggleLikeComment(index),
                            ),
                            Text(comment['likes'].toString()),
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
