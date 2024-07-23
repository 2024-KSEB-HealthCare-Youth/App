import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_data.dart';
import '../models/result_data.dart';
import '../utils/rest_api.dart';
import '../widgets/custom_button.dart';
import '../widgets/profile_detail.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  Future<UserData> _fetchUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('userId');
    if (userId == null) {
      throw Exception('No user ID found');
    }
    return await RestAPI.fetchUserData(userId);
  }

  Future<ResultData> _fetchResultData() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('userId');
    if (userId == null) {
      throw Exception('No user ID found');
    }
    return await RestAPI.fetchResultData(userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
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
      body: FutureBuilder<UserData>(
        future: _fetchUserData(),
        builder: (context, userSnapshot) {
          if (userSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (userSnapshot.hasError) {
            return Center(child: Text('Error: ${userSnapshot.error}'));
          } else if (!userSnapshot.hasData) {
            return const Center(child: Text('No data found'));
          } else {
            final userData = userSnapshot.data!;
            return FutureBuilder<ResultData>(
              future: _fetchResultData(),
              builder: (context, resultSnapshot) {
                if (resultSnapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (resultSnapshot.hasError) {
                  return Center(child: Text('Error: ${resultSnapshot.error}'));
                } else if (!resultSnapshot.hasData) {
                  return const Center(child: Text('No result data found'));
                } else {
                  final resultData = resultSnapshot.data!;
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
                                backgroundImage: userData.profileImage != null
                                    ? NetworkImage(userData.profileImage!)
                                    : const AssetImage(
                                            'assets/images/default_profile.png')
                                        as ImageProvider,
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ProfileDetail(
                                        label: 'Name', value: userData.name),
                                    const SizedBox(height: 8),
                                    ProfileDetail(
                                        label: 'Gender',
                                        value: userData.gender),
                                    const SizedBox(height: 8),
                                    ProfileDetail(
                                        label: 'Age',
                                        value: userData.age.toString()),
                                    const SizedBox(height: 8),
                                    ProfileDetail(
                                        label: 'Email',
                                        value: userData.email ?? 'N/A'),
                                    const SizedBox(height: 8),
                                    ProfileDetail(
                                        label: 'Phone',
                                        value: userData.phoneNumber),
                                    const SizedBox(height: 8),
                                    if (resultData.skintype != null)
                                      ProfileDetail(
                                          label: 'Skin Type',
                                          value: resultData.skintype!),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: CustomButton(
                              text: '수정',
                              onPressed: () {},
                            ),
                          ),
                          const SizedBox(height: 32),
                          const Text(
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
                                color: const Color(0xFFD9D9D9),
                                shape: StarBorder.polygon(sides: 6),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Container(
                            width: double.infinity,
                            height: 111,
                            decoration: ShapeDecoration(
                              color: const Color(0x7FE8E8E8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                          const SizedBox(height: 32),
                          CustomButton(
                            text: '화장품 추천받으러가기',
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, '/recommendation_page');
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                }
              },
            );
          }
        },
      ),
    );
  }
}
