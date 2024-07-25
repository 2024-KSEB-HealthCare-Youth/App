import 'dart:io';
import 'package:flutter/material.dart';
import '../utils/rest_api.dart'; // Adjust import according to your project structure

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
    _uploadImage();
  }

  Future<void> _uploadImage() async {
    try {
      var aiData = await RestAPI.uploadImage(widget.imagePath);
      Navigator.of(context).pushReplacementNamed(
        '/my_page',
        arguments: {
          'imagePath': widget.imagePath,
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
        title: Text('로딩중...'),
      ),
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
