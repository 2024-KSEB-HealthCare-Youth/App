import 'package:flutter/material.dart';
import '../../services/user_service.dart';
import '../../data/dtos/my_page_dto.dart';

class LoadingScreen extends StatefulWidget {
  final String imagePath;

  const LoadingScreen({super.key, required this.imagePath});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  final UserService _userService = UserService();

  @override
  void initState() {
    super.initState();
    _uploadImageAndFetchAiData();
  }

  Future<void> _uploadImageAndFetchAiData() async {
    try {
      // Use UserService to upload image and fetch data
      MyPageDTO myPageData =
          await _userService.uploadImageAndFetchData(widget.imagePath);
      if (myPageData == null) {
        throw Exception('MyPageDTO is null');
      }
      // Navigate to MyPage with the received AI data
      Navigator.of(context).pushReplacementNamed(
        '/my_page',
        arguments: myPageData,
      );
    } catch (e) {
      // Handle error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Image upload failed. Please try again.')),
      );
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loading...'),
      ),
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
