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
    final loginId = prefs.getString('loginId');
    final accessToken = await _storage.read(key: 'access_token');

    if (loginId == null || accessToken == null) {
      throw Exception('No login ID or access token found');
    }

    final userData = await RestAPI.fetchUserData(loginId);
    return {'userData': userData, 'accessToken': accessToken};
  }

  Future<UserData> fetchUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final loginId = prefs.getString('loginId');
    if (loginId == null) {
      throw Exception('No login ID found');
    }
    return await RestAPI.fetchUserData(loginId);
  }

  Future<ResultData> fetchResultData(String loginId) async {
    return await RestAPI.fetchResultData(loginId);
  }

  Future<void> login(String loginId, String password) async {
    await RestAPI.login(loginId, password);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('loginId', loginId);
  }

  Future<void> updateUserData(UserData userData, String loginId) async {
    await RestAPI.updateUserData(userData, loginId);
  }

  Future<PastData> fetchPastData(String loginId) async {
    return await RestAPI.fetchPastData(loginId);
  }
}
