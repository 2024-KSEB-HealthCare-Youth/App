import 'package:flutter/material.dart';

class Recommendation extends StatelessWidget {
  final String userName;
  final String skinType;

  const Recommendation({super.key, required this.userName, required this.skinType});

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '$userName’s skin type\n',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Pacifico',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    'is $skinType',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Pacifico',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 33),
            SizedBox(
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
              children: [
                buildProductCard(context),
                buildProductCard(context),
                buildProductCard(context),
              ],
            ),
            const SizedBox(height: 33),
            SizedBox(
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
              children: [
                buildProductCard(context),
                buildProductCard(context),
                buildProductCard(context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProductCard(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3 - 22,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xFFDFDFDF)),
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
                image: AssetImage('assets/images/sample_product.png'),
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
                  'Beautya Prestige la Mousse Micellaire',
                  style: TextStyle(
                    color: Color(0xFFA10550),
                    fontSize: 14,
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
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
