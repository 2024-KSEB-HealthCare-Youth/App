import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../models/user_data.dart';
import '../models/result_data.dart';
import '../models/past_data.dart';
import '../utils/rest_api.dart';

class UserService {
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  Future<Map<String, dynamic>> fetchUserDataAndToken() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('userId');
    final accessToken = await _storage.read(key: 'access_token');

    if (userId == null || accessToken == null) {
      throw Exception('No user ID or access token found');
    }

    final userData = await RestAPI.fetchUserData(userId);
    return {'userData': userData, 'accessToken': accessToken};
  }

  Future<UserData> fetchUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('userId');
    if (userId == null) {
      throw Exception('No user ID found');
    }
    return await RestAPI.fetchUserData(userId);
  }

  Future<ResultData> fetchResultData(String userId) async {
    return await RestAPI.fetchResultData(userId);
  }

  Future<void> login(String userId, String password) async {
    await RestAPI.login(userId, password);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userId', userId);
  }

  Future<void> updateUserData(UserData userData, String userId) async {
    await RestAPI.updateUserData(userData, userId);
  }

  Future<PastData> fetchPastData(String userId) async {
    return await RestAPI.fetchPastData(userId);
  }
}
