import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Map<String, String>> _skinInfo = [
    {
      'title': '복합성',
      'description': 'UV 촬영을 통해 측정된 복합성을 검출합니다.',
      'icon': 'assets/icons/oil.png',
    },
    {
      'title': '아토피',
      'description': '빨간 피부와 피부가 부어오른 정도에 따라 아토피를 검출합니다.',
      'icon': 'assets/icons/oil.png',
    },
    {
      'title': '여드름(염증성)',
      'description':
          '여드름 검출 영역(ROI) 내에서 염증 정도를 농포, 구진, 결절 형태로 구분하여 염증성 여드름을 검출합니다.',
      'icon': 'assets/icons/inflammatory_acne.png',
    },
    {
      'title': '주름',
      'description': '이마, 미간, 눈 주위의 미세주름 및 큰 주름, 입 주위의 팔자주름을 검출합니다.',
      'icon': 'assets/icons/wrinkle.png',
    },
    {
      'title': '건성',
      'description': '피부의 유분, 수분을 체크하여 건성을 검출합니다.',
      'icon': 'assets/icons/pores.png',
    },
    {
      'title': '지성',
      'description': '피부의 피지 분비량을 체크하여 지성을 검출합니다',
      'icon': 'assets/icons/noninflammatory_acne.png',
    },
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
          buildInfoSection(),
        ],
      ),
    );
  }

  Widget buildImageBox() {
    return AspectRatio(
      aspectRatio: 1457 / 800,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        clipBehavior: Clip.antiAlias,
        child: Image.asset(
          'assets/images/main_pic.png',
          fit: BoxFit.cover,
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
              Icon(Icons.camera_alt, color: Colors.white),
              SizedBox(width: 10),
              Text(
                '진단하러가기',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 10),
              Icon(Icons.arrow_forward, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfoSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '피부 점수, 나이, 6가지 피부 항목 분석',
            style: TextStyle(
              color: Colors.red,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            '단 한 번의 촬영으로\n당신의 피부를 정확하게 알아보세요.',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Youth는 전 세계 3만개 이상의 피부 데이터를 보유하고 있습니다. ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: buildScoreAndAgeBox()),
              const SizedBox(width: 16),
              Expanded(child: buildInfoBox()),
            ],
          ),
          const SizedBox(height: 16),
          buildIconRow(),
        ],
      ),
    );
  }

  Widget buildScoreAndAgeBox() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildScoreBox('피부 점수', '8', '/10'),
        const SizedBox(height: 16),
        buildScoreBox('피부 나이', '33', ''),
      ],
    );
  }

  Widget buildScoreBox(String label, String score, String suffix) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 4),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: score,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: suffix,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildInfoBox() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset(
              _skinInfo[_selectedIndex]['icon']!,
              width: 30,
              height: 30,
            ),
            const SizedBox(width: 8),
            Text(
              _skinInfo[_selectedIndex]['title']!,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          _skinInfo[_selectedIndex]['description']!,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget buildIconRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(_skinInfo.length, (index) {
        return GestureDetector(
          onTap: () => _onItemTapped(index),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(
                color:
                    _selectedIndex == index ? Colors.red : Colors.transparent,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              _skinInfo[index]['icon']!,
              width: 25,
              height: 25,
            ),
          ),
        );
      }),
    );
  }
}
