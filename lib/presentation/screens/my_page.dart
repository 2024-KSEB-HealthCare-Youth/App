import 'package:flutter/material.dart';
import '../../data/dtos/my_page_dto.dart';
import '../widgets/custom_button.dart';
import '../widgets/profile_detail.dart';
import '../widgets/polygon_pentagon_widgets.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final MyPageDTO myPageData =
        ModalRoute.of(context)!.settings.arguments as MyPageDTO;

    // Ensure we are extracting the correct values in a specific order
    List<double> polygonValues = [
      myPageData.probabilities['DRY'] ?? 0.0,
      myPageData.probabilities['COMBINATION'] ?? 0.0,
      myPageData.probabilities['OILY'] ?? 0.0,
      myPageData.probabilities['ACNE'] ?? 0.0,
      myPageData.probabilities['WRINKLES'] ?? 0.0,
    ];

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
      body: Padding(
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
                    backgroundImage: (myPageData.profileImage != null &&
                            myPageData.profileImage!.isNotEmpty)
                        ? NetworkImage(myPageData.profileImage!)
                        : const AssetImage('assets/images/default_profile.png')
                            as ImageProvider,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProfileDetail(label: 'Name', value: myPageData.name),
                        const SizedBox(height: 8),
                        ProfileDetail(
                            label: 'Gender', value: myPageData.gender),
                        const SizedBox(height: 8),
                        ProfileDetail(
                            label: 'Age', value: myPageData.age.toString()),
                        const SizedBox(height: 8),
                        ProfileDetail(
                            label: 'Email', value: myPageData.email ?? 'N/A'),
                        const SizedBox(height: 8),
                        ProfileDetail(
                            label: 'Phone', value: myPageData.phoneNumber),
                        const SizedBox(height: 8),
                        ProfileDetail(
                            label: 'Skin Type', value: myPageData.simpleSkin),
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
                child: PolygonPentagon(
                  values: polygonValues,
                ),
              )),
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
                  'Explanation: ${myPageData.resultDetails}\n',
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
      ),
    );
  }
}
