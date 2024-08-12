import 'package:flutter/material.dart';
import '../../data/dtos/my_page_dto.dart';
import '../widgets/custom_button.dart';
import '../widgets/profile_detail.dart';
import '../widgets/polygon_pentagon_widgets.dart';

class MyPage extends StatefulWidget {
  final MyPageDTO myPageData;

  const MyPage({super.key, required this.myPageData});

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  late MyPageDTO _currentData;

  @override
  void initState() {
    super.initState();
    _currentData = widget.myPageData;
  }

  Future<void> _navigateToEditAccountPage() async {
    await Navigator.pushNamed(
      context,
      '/edit_account',
    );
  }

  @override
  Widget build(BuildContext context) {
    // Extract values for the polygon in a specific order
    List<double> polygonValues = [
      _currentData.probabilities['DRY'] ?? 0.0,
      _currentData.probabilities['COMBINATION'] ?? 0.0,
      _currentData.probabilities['OILY'] ?? 0.0,
      _currentData.probabilities['ACNE'] ?? 0.0,
      _currentData.probabilities['WRINKLES'] ?? 0.0,
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: (_currentData.profileImage != null &&
                                _currentData.profileImage!.isNotEmpty)
                            ? NetworkImage(_currentData.profileImage!)
                            : const AssetImage(
                                    'assets/images/default_profile.png')
                                as ImageProvider,
                      ),
                      const SizedBox(height: 16),
                      CustomButton(
                        text: '수정',
                        onPressed: _navigateToEditAccountPage,
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: ProfileDetail(
                                label: 'Name',
                                value: _currentData.name ?? 'dummy',
                              ),
                            ),
                            Expanded(
                              child: ProfileDetail(
                                label: 'Gender',
                                value: _currentData.gender ?? 'N/A',
                                textAlign: TextAlign.end, // Align to the right
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        ProfileDetail(
                          label: 'Age',
                          value: _currentData.age.toString(),
                        ),
                        const SizedBox(height: 8),
                        ProfileDetail(
                          label: 'Email',
                          value: _currentData.email ?? 'N/A',
                        ),
                        const SizedBox(height: 8),
                        ProfileDetail(
                          label: 'Skin Type',
                          value: _currentData.simpleSkin ?? 'N/A',
                        ),
                        const SizedBox(height: 8),
                        ProfileDetail(
                          label: 'Phone',
                          value: _currentData.phoneNumber ?? 'N/A',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Diagnostic Results',
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: Container(
                  width: 183,
                  height: 183,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFD9D9D9),
                    shape: StarBorder.polygon(sides: 5),
                  ),
                  child: PolygonPentagon(
                    values: polygonValues,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  '${_currentData.resultDetails}',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              CustomButton(
                text: 'Find My Suitable Cosmetics & Nutrition',
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
