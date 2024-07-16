import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  final String profileImagePath;
  final String name;
  final String nickName;
  final String gender;
  final String age;
  final String email;
  final String phone;

  const MyPage({
    super.key,
    required this.profileImagePath,
    required this.name,
    required this.nickName,
    required this.gender,
    required this.age,
    required this.email,
    required this.phone,
  });

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 36,
                        backgroundImage: AssetImage(profileImagePath),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFE26169),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          '수정',
                          style: TextStyle(fontSize: 13, fontFamily: 'Poppins'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: ProfileDetail(label: 'Name', value: name),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: ProfileDetail(
                                  label: 'Nick Name', value: nickName),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child:
                                  ProfileDetail(label: 'Gender', value: gender),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: ProfileDetail(label: 'Age', value: age),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        ProfileDetail(label: 'Email', value: email),
                        const SizedBox(height: 8),
                        ProfileDetail(label: 'Phone', value: phone),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Text(
                'Diagnostic Results',
                style: TextStyle(
                  color: Color(0xFFE26169),
                  fontSize: 20,
                  fontFamily: 'Nobile',
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.30,
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: Container(
                  width: 183,
                  height: 183,
                  decoration: ShapeDecoration(
                    color: Color(0xFFD9D9D9),
                    shape: StarBorder.polygon(sides: 6),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                height: 111,
                decoration: ShapeDecoration(
                  color: Color(0x7FE8E8E8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/recommendation_page');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFE26169),
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  '화장품 추천받으러가기',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileDetail extends StatelessWidget {
  final String label;
  final String value;

  ProfileDetail({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Opacity(
          opacity: 0.6,
          child: Text(
            label,
            style: TextStyle(
              color: Color(0xFF757575),
              fontSize: 14,
              fontFamily: 'Nobile',
            ),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          value,
          style: TextStyle(
            color: Color(0xFF191C3D),
            fontSize: 18,
            fontFamily: 'Abhaya Libre',
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
