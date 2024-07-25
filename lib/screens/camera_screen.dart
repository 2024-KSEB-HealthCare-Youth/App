import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'display_picture.dart';

class takePictureScreen extends StatefulWidget {
  final CameraDescription camera;

  const takePictureScreen({super.key, required this.camera});

  @override
  takePictureScreenState createState() => takePictureScreenState();
}

class takePictureScreenState extends State<takePictureScreen> {
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
      appBar: AppBar(title: const Text('Youth')),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                FutureBuilder<void>(
                  future: _initializeControllerFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return CameraPreview(_controller);
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
                Center(
                  child: Container(
                    width: 300, // Adjust width as needed
                    height: 400, // Adjust height as needed
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(
                          200), // Adjust for ellipse shape
                      border: Border.all(color: Colors.pink, width: 4),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('keep your face inside the circle'),
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      await _initializeControllerFuture;
                      final image = await _controller.takePicture();
                      if (!mounted) return;
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DisplayPictureScreen(
                            imagePath: image.path,
                          ),
                        ),
                      );
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: const Text('사진 다시찍기'),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/my_page');
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
