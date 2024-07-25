// widgets/menu.dart

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/user_service.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      key: Key('menu_drawer'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 16, top: 16),
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          _buildMenuItem(
            key: Key('게시판'),
            title: '게시판',
            onTap: () {
              Navigator.pushNamed(context, '/CommentsScreen');
            },
          ),
          _buildMenuItem(
            key: Key('과거 진단 결과 조회'),
            title: '과거 진단 결과 조회',
            onTap: () async {
              final userService = UserService();
              final prefs = await SharedPreferences.getInstance();
              final userId = prefs.getString('userId');
              if (userId != null) {
                try {
                  final pastData = await userService.fetchPastData(userId);
                  Navigator.pushNamed(
                    context,
                    '/past_log',
                    arguments: pastData,
                  );
                } catch (e) {
                  // Handle error
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to load past data')),
                  );
                }
              }
            },
          ),
          _buildMenuItem(
            key: Key('My Page'),
            title: 'My Page',
            onTap: () {
              Navigator.pushNamed(context, '/my_page');
            },
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
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
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      onTap: onTap,
    );
  }
}
