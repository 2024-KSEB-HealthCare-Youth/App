import 'package:flutter/material.dart';
import '../../data/dtos/my_page_dto.dart';
import '../../services/user_service.dart';
import '../widgets/custom_button.dart';
import '../widgets/profile_detail.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

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
      body: FutureBuilder<MyPageDTO>(
        future: UserService().fetchMyPageDTO(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No data found'));
          } else {
            final data = snapshot.data!;
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
                          backgroundImage: data.profileImage != null
                              ? NetworkImage(data.profileImage!)
                              : const AssetImage(
                                      'assets/images/default_profile.png')
                                  as ImageProvider,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ProfileDetail(label: 'Name', value: data.name),
                              const SizedBox(height: 8),
                              ProfileDetail(
                                  label: 'Gender', value: data.gender),
                              const SizedBox(height: 8),
                              ProfileDetail(
                                  label: 'Age', value: data.age.toString()),
                              const SizedBox(height: 8),
                              ProfileDetail(
                                  label: 'Email', value: data.email ?? 'N/A'),
                              const SizedBox(height: 8),
                              ProfileDetail(
                                  label: 'Phone', value: data.phoneNumber),
                              const SizedBox(height: 8),
                              ProfileDetail(
                                  label: 'Skin Type',
                                  value: data.simpleSkin ?? 'Unknown'),
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
                          Navigator.pushNamed(
                            context,
                            '/edit_account',
                          );
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
                        child: data.resultPath.isNotEmpty
                            ? Image.network(data.resultPath)
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
                        'Simple Skin: ${data.simpleSkin}\n',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 32),
                    CustomButton(
                      text: 'find my suitable cosmetics&nutrition',
                      onPressed: () {
                        Navigator.pushNamed(context, '/recommendation_page');
                      },
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
