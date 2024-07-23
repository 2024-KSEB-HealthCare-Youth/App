import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_data.dart';
import '../models/result_data.dart';

class RestAPI {
  static const String baseUrl =
      'http://52.79.103.61:8080'; // Use 10.0.2.2 for Android emulator
  static const Map<String, String> headers = {
    'Content-Type': 'application/json'
  };

  /// Signs up a new user.
  ///
  /// Takes a [UserData] object as input and sends it to the server to create
  /// a new user account. Returns the HTTP response from the server.
  static Future<http.Response> signUp(UserData userData) async {
    final requestBody = jsonEncode(userData.toJson());
    print('Request body: $requestBody');

    try {
      final response = await http.post(
        Uri.parse('$baseUrl/members'),
        headers: headers,
        body: requestBody,
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      return response;
    } catch (e) {
      print('Sign up failed: $e');
      throw Exception('Sign up failed: $e');
    }
  }

  /// Logs in a user.
  ///
  /// Takes [userId] and [password] as input, sends them to the server, and
  /// stores the [userId] in shared preferences if the login is successful.
  /// Throws an [Exception] if the login fails.
  static Future<void> login(String userId, String password) async {
    final requestBody = jsonEncode({'userId': userId, 'password': password});
    print('Request body: $requestBody');

    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        headers: headers,
        body: requestBody,
      );
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

  /// Fetches user data.
  ///
  /// Takes [userId] as input, sends a GET request to the server, and returns
  /// a [UserData] object if successful. Throws an [Exception] if the request
  /// fails.
  static Future<UserData> fetchUserData(String userId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/members/$userId'),
        headers: headers,
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

  /// Fetches result data.
  ///
  /// Takes [userId] as input, sends a GET request to the server, and returns
  /// a [ResultData] object if successful. Throws an [Exception] if the request
  /// fails.
  static Future<ResultData> fetchResultData(String userId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/results/$userId'),
        headers: headers,
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
