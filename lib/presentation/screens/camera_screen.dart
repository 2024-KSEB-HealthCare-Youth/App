import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import '../widgets/local_storage.dart';
import '../screens/display_picture.dart';

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
        title: Text('Youth',
            style: TextStyle(fontFamily: 'Pacifico', fontSize: 30)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: [
                // 카메라 프리뷰가 화면을 가득 채우도록 설정
                Positioned.fill(
                  child: CameraPreview(_controller),
                ),
                // 타원과 텍스트 및 버튼을 오버레이
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'keep your face inside the circle',
                        style: TextStyle(
                            fontFamily: 'Pacifico',
                            color: Colors.white, // 텍스트를 흰색으로 설정
                            fontSize: 18),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.width * 1.2,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(200),
                            border:
                                Border.all(color: Colors.pinkAccent, width: 4),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: FloatingActionButton(
                        child: Icon(Icons.camera_alt),
                        onPressed: () async {
                          try {
                            await _initializeControllerFuture;
                            final image = await _controller.takePicture();

                            final localPath =
                                await saveImageLocally(image.path);
                            if (localPath.isNotEmpty) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => DisplayPictureScreen(
                                      imagePath: localPath),
                                ),
                              );
                            }
                          } catch (e) {
                            print(e);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
