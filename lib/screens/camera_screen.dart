import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'display_picture.dart';

class TakePictureScreen extends StatefulWidget {
  final CameraDescription camera;

  const TakePictureScreen({super.key, required this.camera});

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.high,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Youth', style: TextStyle(fontFamily: 'Pacifico')),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<void>(
              future: _initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: CameraPreview(_controller),
                        ),
                        Container(
                          width: 300, // Adjust width as needed
                          height: 400, // Adjust height as needed
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(
                                200), // Adjust for ellipse shape
                            border: Border.all(color: Colors.pink, width: 4),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('keep your face inside the circle',
                style: TextStyle(fontFamily: 'Pacifico')),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                try {
                  await _initializeControllerFuture;
                  final image = await _controller.takePicture();
                  if (!mounted) return;
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          DisplayPictureScreen(imagePath: image.path),
                    ),
                  );
                } catch (e) {
                  print(e);
                }
              },
              child: const Text('take picture',
                  style: TextStyle(fontFamily: 'Pacifico')),
            ),
          ),
        ],
      ),
    );
  }
}
