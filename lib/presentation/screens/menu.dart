import 'package:flutter/material.dart';
import 'package:myapp/data/dtos/my_page_dto.dart';
import 'package:myapp/services/user_service.dart';
import '../screens/my_page.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      key: const Key('menu_drawer'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(right: 16, top: 16),
            alignment: Alignment.topRight,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          _buildMenuItem(
            key: const Key('게시판'),
            title: '게시판',
            onTap: () {
              Navigator.pushNamed(context, '/CommentsScreen');
            },
          ),
          _buildMenuItem(
              key: const Key('과거 진단 결과 조회'),
              title: '과거 진단 결과 조회',
              onTap: () async {
                Navigator.pushNamed(
                  context,
                  '/past_log',
                );
              }),
          _buildMenuItem(
            key: const Key('My Page'),
            title: 'My Page',
            onTap: () async {
              final userService = UserService();
              try {
                MyPageDTO myPageData = await userService.getMypagedata();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => MyPage(myPageData: myPageData),
                  ),
                );
              } catch (e) {
                print('Failed to load MyPage data: $e');
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Failed to load MyPage data')),
                );
              }
            },
          ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Tel. 031-xxx-xxxx', style: TextStyle(fontSize: 14)),
                SizedBox(height: 4),
                Text('loc. Kyonggi Univ', style: TextStyle(fontSize: 14)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required Key key,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      key: key,
      title: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      onTap: onTap,
    );
  }
}
