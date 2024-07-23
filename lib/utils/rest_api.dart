import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_data.dart';
import '../models/result_data.dart';

class RestAPI {
  static const String baseUrl =
      'http://10.0.2.2:8080'; // Use 10.0.2.2 for Android emulator

  static Future<void> signUp(UserData userData) async {
    try {
      final requestBody = jsonEncode(userData.toJson());
      print('Request body: $requestBody');

      final response = await http.post(
        Uri.parse('$baseUrl/members'),
        headers: {'Content-Type': 'application/json'},
        body: requestBody,
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode != 200) {
        throw Exception('Failed to sign up: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Sign up failed: $e');
      throw Exception('Sign up failed: $e');
    }
  }

  // Other methods remain unchanged
  static Future<void> login(String userId, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login'), // 로그인 엔드포인트 수정
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'userId': userId, 'password': password}),
      );
      print('Request body: ${jsonEncode({
            'userId': userId,
            'password': password
          })}');
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('userId', data['userId']);
      } else {
        throw Exception('Failed to log in: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Login failed: $e');
      throw Exception('Login failed: $e');
    }
  }

  static Future<UserData> fetchUserData(String userId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/members/$userId'),
        headers: {'Content-Type': 'application/json'},
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        return UserData.fromJson(responseData);
      } else {
        throw Exception('Failed to fetch user data: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Fetch user data failed: $e');
      throw Exception('Fetch user data failed: $e');
    }
  }

  static Future<ResultData> fetchResultData(String userId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/results/$userId'), // 결과 데이터 엔드포인트 수정
        headers: {'Content-Type': 'application/json'},
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        return ResultData.fromJson(responseData);
      } else {
        throw Exception(
            'Failed to fetch result data: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Fetch result data failed: $e');
      throw Exception('Fetch result data failed: $e');
    }
  }
}
