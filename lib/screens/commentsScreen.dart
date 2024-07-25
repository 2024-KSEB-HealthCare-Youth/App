// screens/comments_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/comment_service.dart';

class CommentsScreen extends StatelessWidget {
  const CommentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CommentService(),
      child: Scaffold(
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
              _buildCommentInputField(context),
              const SizedBox(height: 20),
              Expanded(
                child: Consumer<CommentService>(
                  builder: (context, commentService, _) {
                    return ListView.builder(
                      key: const Key('posts_list'),
                      itemCount: commentService.posts.length,
                      itemBuilder: (context, index) {
                        final post = commentService.posts[index];
                        final isLiked = commentService.isPostLiked(post['id']);
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PostDetailScreen(
                                post: post,
                                postIndex: index,
                              ),
                            ));
                          },
                          child: _buildPostItem(
                              context, post, isLiked, commentService, index),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCommentInputField(BuildContext context) {
    final commentService = Provider.of<CommentService>(context, listen: false);
    final TextEditingController _commentController = TextEditingController();

    return Row(
      children: [
        const CircleAvatar(
          backgroundImage: NetworkImage('https://via.placeholder.com/150'),
          radius: 30,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: TextField(
            controller: _commentController,
            decoration: InputDecoration(
              labelText: 'Leave a comment',
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
          onPressed: () {
            if (_commentController.text.isNotEmpty) {
              commentService.addComment(_commentController.text);
              _commentController.clear();
            }
          },
        ),
      ],
    );
  }

  Widget _buildPostItem(BuildContext context, Map<String, dynamic> post,
      bool isLiked, CommentService commentService, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            radius: 20,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post['name'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  post['date'],
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 5),
                Text(post['comment']),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Column(
            children: [
              IconButton(
                icon: Icon(
                  isLiked ? Icons.thumb_up : Icons.thumb_up_alt_outlined,
                  color: isLiked ? Colors.blue : null,
                ),
                onPressed: () {
                  commentService.toggleLike(post['id']);
                },
              ),
              Text(post['likes'].toString()),
            ],
          ),
        ],
      ),
    );
  }
}

class PostDetailScreen extends StatefulWidget {
  final Map<String, dynamic> post;
  final int postIndex;

  const PostDetailScreen(
      {Key? key, required this.post, required this.postIndex})
      : super(key: key);

  @override
  _PostDetailScreenState createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final commentService = Provider.of<CommentService>(context, listen: false);

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
            _buildPostDetails(),
            const SizedBox(height: 20),
            _buildCommentsList(),
            _buildCommentInputField(context, commentService),
          ],
        ),
      ),
    );
  }

  Widget _buildPostDetails() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            radius: 20,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.post['name'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.post['date'],
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 5),
                Text(widget.post['comment']),
              ],
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }

  Widget _buildCommentsList() {
    return Expanded(
      child: ListView.builder(
        key: const Key('comments_list'),
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
                        ),
                      ),
                      Text(
                        comment['date'],
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(comment['comment']),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.thumb_up_alt_outlined),
                      onPressed: () {
                        setState(() {
                          comment['likes']++;
                        });
                      },
                    ),
                    Text(comment['likes'].toString()),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildCommentInputField(
      BuildContext context, CommentService commentService) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _commentController,
            decoration: InputDecoration(
              labelText: 'Leave a comment',
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
          onPressed: () {
            if (_commentController.text.isNotEmpty) {
              final newComment = {
                'name': 'New User',
                'date': 'Today',
                'comment': _commentController.text,
                'likes': 0,
              };
              commentService.addCommentToPost(widget.postIndex, newComment);
              _commentController.clear();
            }
          },
        ),
      ],
    );
  }
}
