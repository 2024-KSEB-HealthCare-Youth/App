import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {
            Navigator.pushNamed(context, '/menu');
          },
        ),
        title: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/main_page');
          },
          child: const Text(
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
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          buildImageBox(),
          const SizedBox(height: 16),
          buildDiagnosisButton(context),
          const SizedBox(height: 16),
          buildPlaceholderBox(),
        ],
      ),
    );
  }

  Widget buildPlaceholderBox() {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  Widget buildImageBox() {
    return AspectRatio(
      aspectRatio: 1457 / 800, // 원하는 비율로 설정합니다.
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        clipBehavior: Clip.antiAlias,
        child: Image.asset(
          'assets/images/main_pic.png',
          fit: BoxFit.cover, // BoxFit 옵션을 사용하여 이미지 크기를 조정합니다.
        ),
      ),
    );
  }

  Widget buildDiagnosisButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/camera_screen');
      },
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: const Color(0xFFE26169),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.camera_alt, color: Colors.white), // 카메라 아이콘 추가
              SizedBox(width: 10), // 아이콘과 텍스트 간 간격 추가
              Text(
                '진단하러가기',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 10), // 아이콘 간 간격 추가
              Icon(Icons.arrow_forward, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
