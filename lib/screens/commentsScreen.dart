import 'package:flutter/material.dart';
import 'package:myapp/screens/createPostScreen.dart';
//import 'package:myapp/screens/post_detail_screen.dart'; // Ensure this import is correct

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({Key? key}) : super(key: key);

  @override
  _CommentsScreenState createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  final List<Map<String, dynamic>> _posts = [
    {
      'name': 'Alyce Lambo',
      'date': '25/06/2020',
      'title': 'Convenient and Rewarding',
      'comment':
          'Really convenient and the points system helps benefit loyalty. Some mild glitches here and there, but nothing too egregious. Obviously needs to roll out to more remote',
      'likes': 10,
      'comments': [
        {
          'name': 'Brian C',
          'date': '25/06/2020',
          'comment': 'Great post!',
          'likes': 5
        }
      ],
    },
    // Additional posts...
  ];

  final Set<int> _likedPosts = Set(); // Tracks liked posts

  void _navigateToCreatePost() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => CreatePostScreen(onPostCreated: (newPost) {
        setState(() {
          _posts.insert(0, newPost); // Insert the new post at the top
        });
      }),
    ));
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
            // "글 작성하기" section styled to match the image
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
                                  _posts[index]['name'],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  _posts[index]['date'],
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  _posts[index]
                                      ['title'], // Display the title here
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  _posts[index]['comment'],
                                  maxLines:
                                      2, // Optional: limit the number of lines
                                  overflow:
                                      TextOverflow.ellipsis, // Handle overflow
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
                  CircleAvatar(
                    backgroundImage:
                        NetworkImage('https://via.placeholder.com/150'),
                    radius: 20,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.post['name'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          widget.post['date'],
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(widget.post['comment']),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
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
                        CircleAvatar(
                          backgroundImage:
                              NetworkImage('https://via.placeholder.com/150'),
                          radius: 20,
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                comment['name'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                comment['date'],
                                style: TextStyle(
                                  color: Colors.grey[600],
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(comment['comment']),
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
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
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
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
