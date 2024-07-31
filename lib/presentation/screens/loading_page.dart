import 'package:flutter/material.dart';
import '../../utils/rest_api.dart';
import '../../data/models/ai_data.dart'; // Ensure this import

class LoadingScreen extends StatefulWidget {
  final String imagePath;

  const LoadingScreen({super.key, required this.imagePath});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    _uploadImageAndFetchAiData();
  }

  Future<void> _uploadImageAndFetchAiData() async {
    try {
      // Upload the image and fetch AI data
      AiData aiData = await RestAPI.uploadImage(widget.imagePath);

      // Navigate to MyPage with the received AI data and image path
      Navigator.of(context).pushReplacementNamed(
        '/my_page',
        arguments: {
          'aiData': aiData,
        },
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
