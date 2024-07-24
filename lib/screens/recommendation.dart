import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_data.dart';
import '../models/ai_data.dart';
import '../utils/rest_api.dart';

class Recommendation extends StatelessWidget {
  const Recommendation({super.key});

  Future<UserData> _fetchUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('userId');
    if (userId == null) {
      throw Exception('No user ID found');
    }
    return await RestAPI.fetchUserData(userId);
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
            final skinTypeDescription =
                '${aiData.simpleSkin}, ${aiData.expertSkin.join(', ')}';

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      width: double.infinity,
                      child: RichText(
                        text: TextSpan(
                          text: '${userData.name}’s skin type\n',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Pacifico',
                            fontWeight: FontWeight.w400,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: skinTypeDescription.isNotEmpty
                                  ? 'is $skinTypeDescription'
                                  : 'is not available yet.',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: 'Pacifico',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 33),
                    const SizedBox(
                      width: double.infinity,
                      child: Text(
                        'Youth’s recommended cosmetics',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Pacifico',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(height: 33),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(3, (index) {
                        return buildProductCard(
                          context,
                          aiData.cosNames[index],
                          aiData.cosPaths[index],
                        );
                      }),
                    ),
                    const SizedBox(height: 33),
                    const SizedBox(
                      width: double.infinity,
                      child: Text(
                        'Youth’s recommended supplements',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Pacifico',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(height: 33),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(3, (index) {
                        return buildProductCard(
                          context,
                          aiData.nutrNames[index],
                          aiData.nutPaths[index],
                        );
                      }),
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

  Widget buildProductCard(BuildContext context, String name, String imagePath) {
    return Container(
      width: MediaQuery.of(context).size.width / 3 - 22,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFDFDFDF)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 110.80,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Color(0xFFA10550),
                    fontSize: 14,
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                const Text(
                  '\$520.00',
                  style: TextStyle(
                    color: Color(0xFF0C0C0C),
                    fontSize: 14,
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
