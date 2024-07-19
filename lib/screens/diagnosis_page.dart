import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'camera_screen.dart';
import 'loading_page.dart';
import 'package:camera/camera.dart';

class DiagnosisPage extends StatelessWidget {
  final CameraDescription camera;

  const DiagnosisPage({super.key, required this.camera});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/main_page');
          },
          child: Text(
            'Youth',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontFamily: 'Pacifico',
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Spacer(),
            buildTextButton(
                context, '1. 사진 촬영하러가기', CameraScreen(camera: camera)),
            const SizedBox(height: 24),
            buildLoadingButton(
                context, '2. 기초 피부 진단', 'https://example.com/basic-diagnosis'),
            const SizedBox(height: 24),
            buildLoadingButton(context, '3. 심화 피부 진단',
                'https://example.com/advanced-diagnosis'),
            const SizedBox(height: 24),
            buildResultButton(context),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Widget buildTextButton(BuildContext context, String text, Widget? page) {
    return GestureDetector(
      onTap: () {
        if (page != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        }
      },
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Color(0xFFD9D9D9),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLoadingButton(BuildContext context, String text, String url) {
    return GestureDetector(
      onTap: () async {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoadingPage()),
        );

        try {
          final response = await http.get(Uri.parse(url));

          if (response.statusCode == 200) {
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('결과'),
                content: Text('서버 응답: ${response.body}'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('확인'),
                  ),
                ],
              ),
            );
          } else {
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('오류'),
                content: Text('서버 오류: ${response.statusCode}'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('확인'),
                  ),
                ],
              ),
            );
          }
        } catch (e) {
          Navigator.pop(context);
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('오류'),
              content: Text('요청 중 오류가 발생했습니다: $e'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('확인'),
                ),
              ],
            ),
          );
        }
      },
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Color(0xFFD9D9D9),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildResultButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/my_page');
      },
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFE26169),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            '결과 확인하러가기',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
