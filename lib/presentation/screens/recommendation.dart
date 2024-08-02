import 'package:flutter/material.dart';
import '../../data/dtos/recommend_dto.dart';
import '../../services/user_service.dart';

class Recommendation extends StatelessWidget {
  Recommendation({super.key});

  final UserService _userService = UserService();

  Future<RecommendDTO> _fetchRecommendDTO() async {
    return await _userService.fetchRecommendDTO();
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
      body: FutureBuilder<RecommendDTO>(
        future: _fetchRecommendDTO(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No data found'));
          } else {
            final recommendDTO = snapshot.data!;
            final skinTypeDescription =
                '${recommendDTO.simpleSkin}, ${recommendDTO.expertSkin.join(', ')}';

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildSkinTypeDescription(
                        recommendDTO.name, skinTypeDescription),
                    const SizedBox(height: 33),
                    _buildSectionTitle('Youth’s recommended cosmetics'),
                    const SizedBox(height: 33),
                    _buildProductRow(
                        context, recommendDTO.cosNames, recommendDTO.cosPaths),
                    const SizedBox(height: 33),
                    _buildSectionTitle('Youth’s recommended supplements'),
                    const SizedBox(height: 33),
                    _buildProductRow(context, recommendDTO.nutrNames,
                        recommendDTO.nutrPaths),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildSkinTypeDescription(String name, String skinTypeDescription) {
    return Container(
      width: double.infinity,
      child: RichText(
        text: TextSpan(
          text: '$name’s skin type\n',
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
    );
  }

  Widget _buildSectionTitle(String title) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontFamily: 'Pacifico',
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _buildProductRow(
      BuildContext context, List<String> names, List<String> paths) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(names.length, (index) {
        return _buildProductCard(context, names[index], paths[index]);
      }),
    );
  }

  Widget _buildProductCard(
      BuildContext context, String name, String imagePath) {
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
