import 'dart:io';
import 'package:flutter/material.dart';
import 'loading_page.dart';
import '../utils/rest_api.dart'; // Ensure you have this import

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('사진 보기')),
      body: Column(
        children: [
          Image.file(File(imagePath)),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('사진 다시찍기'),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () async {
                    // Upload the image before navigating to the LoadingScreen
                    try {
                      await RestAPI.uploadImage(imagePath);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              LoadingScreen(imagePath: imagePath),
                        ),
                      );
                    } catch (e) {
                      // Handle any errors here
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Image upload failed: $e')),
                      );
                    }
                  },
                  child: const Text('결과 확인하러가기'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
