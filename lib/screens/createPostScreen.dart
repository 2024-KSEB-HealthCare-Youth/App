import 'package:flutter/material.dart';
import 'package:myapp/widgets/custom_button.dart';
import '../utils/rest_api.dart';
import '../models/user_data.dart';
import '../services/user_service.dart';
import '../widgets/common_widgets.dart'; // CustomButton이 정의된 파일 경로를 적절히 변경

class CreatePostScreen extends StatefulWidget {
  final Function(Map<String, dynamic>) onPostCreated;

  const CreatePostScreen({Key? key, required this.onPostCreated})
      : super(key: key);

  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  UserData? _currentUser;

  @override
  void initState() {
    super.initState();
    _fetchCurrentUser();
  }

  Future<void> _fetchCurrentUser() async {
    try {
      final user = await UserService().fetchUserData();
      setState(() {
        _currentUser = user;
      });
    } catch (e) {
      print('Failed to fetch user data: $e');
      // Handle error accordingly
    }
  }

  void _submitPost() async {
    final title = _titleController.text;
    final content = _contentController.text;

    if (title.isNotEmpty && content.isNotEmpty && _currentUser != null) {
      final newPost = {
        'postId': DateTime.now().toString(),
        'title': title,
        'content': content,
        'likeCount': 0,
        'commentCount': 0,
        'viewCount': 0,
        'category': 'FREE',
        'memberId': _currentUser!.loginId,
        'comments': [],
      };

      try {
        final success = await RestAPI.savePost(newPost);

        if (success) {
          widget.onPostCreated(newPost);
          Navigator.of(context).pop();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('Failed to save post. Please try again.')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to save post: $e')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
    }
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (_currentUser != null)
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(_currentUser!.profileImage ??
                        'https://via.placeholder.com/150'),
                    radius: 25,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    _currentUser!.nickName ?? _currentUser!.loginId,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            const SizedBox(height: 20),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                labelStyle: const TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: TextField(
                controller: _contentController,
                maxLines: null,
                expands: true,
                decoration: InputDecoration(
                  labelText: 'Content',
                  labelStyle: const TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: CustomButton(
                text: 'SUBMIT',
                onPressed: _submitPost,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
