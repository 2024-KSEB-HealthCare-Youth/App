import 'package:flutter/material.dart';
import '../models/user_data.dart';
import '../utils/rest_api.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  Future<UserData> _fetchUserData() async {
    final data = await RestAPI.fetchUserData(
        'userId'); // Replace 'userId' with actual user ID
    return UserData.fromJson(data);
  }

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
      body: FutureBuilder<UserData>(
        future: _fetchUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No data found'));
          } else {
            final userData = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 36,
                          backgroundImage: AssetImage(userData.profileImage),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ProfileDetail(
                                  label: 'Name', value: userData.name),
                              SizedBox(height: 8),
                              ProfileDetail(
                                  label: 'Nick Name', value: userData.nickName),
                              SizedBox(height: 8),
                              ProfileDetail(
                                  label: 'Gender', value: userData.gender),
                              SizedBox(height: 8),
                              ProfileDetail(
                                  label: 'Age', value: userData.age.toString()),
                              SizedBox(height: 8),
                              ProfileDetail(
                                  label: 'Email', value: userData.email),
                              SizedBox(height: 8),
                              ProfileDetail(
                                  label: 'Phone', value: userData.phoneNumber),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
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
                    ),
                    SizedBox(height: 32),
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
                    SizedBox(height: 16),
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
                    SizedBox(height: 16),
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
                    SizedBox(height: 32),
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
            );
          }
        },
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
        SizedBox(width: 10),
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
