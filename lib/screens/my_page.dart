import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../models/user_data.dart';
import '../models/ai_data.dart';
import '../models/result_data.dart';
import '../utils/rest_api.dart';
import '../widgets/custom_button.dart';
import '../widgets/profile_detail.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  Future<Map<String, dynamic>> _fetchUserDataAndToken() async {
    final prefs = await SharedPreferences.getInstance();
    final storage = FlutterSecureStorage();
    final userId = prefs.getString('userId');
    final accessToken = await storage.read(key: 'access_token');

    if (userId == null || accessToken == null) {
      throw Exception('No user ID or access token found');
    }

    final userData = await RestAPI.fetchUserData(userId);
    return {'userData': userData, 'accessToken': accessToken};
  }

  Future<ResultData> _fetchResultData(String userId, String accessToken) async {
    return await RestAPI.fetchResultData(userId);
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final AiData aiData = args['resultData'];

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
      body: FutureBuilder<Map<String, dynamic>>(
        future: _fetchUserDataAndToken(),
        builder: (context, userSnapshot) {
          if (userSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (userSnapshot.hasError) {
            return Center(child: Text('Error: ${userSnapshot.error}'));
          } else if (!userSnapshot.hasData) {
            return const Center(child: Text('No data found'));
          } else {
            final userData = userSnapshot.data!['userData'] as UserData;
            final accessToken = userSnapshot.data!['accessToken'] as String;

            return FutureBuilder<ResultData>(
              future: _fetchResultData(userData.loginId, accessToken),
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
                                    if (aiData.simpleSkin != null)
                                      ProfileDetail(
                                          label: 'Skin Type',
                                          value:
                                              aiData.simpleSkin ?? 'Unknown'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: CustomButton(
                              text: '수정',
                              onPressed: () {
                                Navigator.pushNamed(context, 'edit_account');
                              },
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
                              child: aiData.resultPath.isNotEmpty
                                  ? Image.network(aiData.resultPath)
                                  : const Icon(Icons.image_not_supported),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Container(
                            padding: const EdgeInsets.all(16.0),
                            width: double.infinity,
                            decoration: ShapeDecoration(
                              color: const Color(0x7FE8E8E8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Text(
                              'Simple Skin: ${aiData.simpleSkin}\n'
                              'Expert Skin: ${aiData.expertSkin.join(', ')}', //이 부분이 script 부분
                              style: const TextStyle(fontSize: 16),
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
