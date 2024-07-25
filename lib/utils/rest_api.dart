import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../models/user_data.dart';
import '../models/result_data.dart';
import '../models/ai_data.dart';
import '../models/token_response.dart';
import '../models/past_data.dart';

class RestAPI {
  static const String baseUrl = 'http://52.79.103.61:8080';
  static const String flaskUrl = 'http://your-flask-server-ip:5000';
  static const Map<String, String> headers = {
    'Content-Type': 'application/json'
  };
  static final FlutterSecureStorage storage = FlutterSecureStorage();

  // Save tokens to secure storage
  static Future<void> saveTokens(
      String accessToken, String refreshToken) async {
    await storage.write(key: 'access_token', value: accessToken);
    await storage.write(key: 'refresh_token', value: refreshToken);
  }

  // Delete tokens from secure storage
  static Future<void> deleteTokens() async {
    await storage.delete(key: 'access_token');
    await storage.delete(key: 'refresh_token');
  }

  // Retrieve tokens from secure storage
  static Future<Map<String, String?>> getTokens() async {
    final accessToken = await storage.read(key: 'access_token');
    final refreshToken = await storage.read(key: 'refresh_token');
    return {'access_token': accessToken, 'refresh_token': refreshToken};
  }

  // Login method
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
        await saveTokens(data['accessToken'], data['refreshToken']);
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

  // Refresh access token
  static Future<TokenResponse> refreshAccessToken(String refreshToken) async {
    final response = await http.post(
      Uri.parse('$baseUrl/token'),
      headers: {
        'Content-Type': 'application/json',
        'authorization': 'Bearer $refreshToken'
      },
    );
    if (response.statusCode == 200) {
      return TokenResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to refresh token');
    }
  }

  // Fetch user data
  static Future<UserData> fetchUserData(String userId) async {
    final tokens = await getTokens();
    final accessToken = tokens['access_token'];

    try {
      final response = await http.get(
        Uri.parse('$baseUrl/members/$userId'),
        headers: {...headers, 'authorization': 'Bearer $accessToken'},
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

  // Fetch result data
  static Future<ResultData> fetchResultData(String userId) async {
    final tokens = await getTokens();
    final accessToken = tokens['access_token'];

    try {
      final response = await http.get(
        Uri.parse('$baseUrl/results/$userId'),
        headers: {...headers, 'authorization': 'Bearer $accessToken'},
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

  // Sign up method
  static Future<void> signUp(UserData userData) async {
    final requestBody = jsonEncode(userData.toJson());
    print('Request body: $requestBody');

    try {
      final response = await http.post(
        Uri.parse('$baseUrl/members/join'),
        headers: headers,
        body: requestBody,
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        print('Sign up successful.');
      } else {
        throw Exception('Failed to sign up: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Sign up failed: $e');
      throw Exception('Sign up failed: $e');
    }
  }

  // Update user data
  static Future<void> updateUserData(UserData userData, String userId) async {
    final tokens = await getTokens();
    final accessToken = tokens['access_token'];

    final requestBody = jsonEncode(userData.toJson());
    print('Request body: $requestBody');

    try {
      final response = await http.put(
        Uri.parse('$baseUrl/members/$userId'),
        headers: {...headers, 'authorization': 'Bearer $accessToken'},
        body: requestBody,
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        print('User data updated successfully.');
      } else {
        throw Exception('Failed to update user data: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Update user data failed: $e');
      throw Exception('Update user data failed: $e');
    }
  }

  // Fetch past data
  static Future<PastData> fetchPastData(String userId) async {
    final tokens = await getTokens();
    final accessToken = tokens['access_token'];

    try {
      final response = await http.get(
        Uri.parse('$baseUrl/results/lists'),
        headers: {...headers, 'authorization': 'Bearer $accessToken'},
      );

      if (response.statusCode == 200) {
        return PastData.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load past data: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Fetch past data failed: $e');
      throw Exception('Fetch past data failed: $e');
    }
  }

  // Fecth past log by result id & result date
  static Future<ResultData> fetchPast_Result(String resultId) async {
    final tokens = await getTokens();
    final accessToken = tokens['access_token'];

    try {
      final response = await http.get(
        Uri.parse('$baseUrl/results/$resultId'),
        headers: {...headers, 'authorization': 'Bearer $accessToken'},
      );
      if (response.statusCode == 200) {
        return ResultData.fromJson(jsonDecode(response.body));
      } else {
        throw Exception(
            'Failed to load Past_Result data:${response.reasonPhrase}');
      }
    } catch (e) {
      print('Fetch past data failed: $e');
      throw Exception('Fetch past data failed: $e');
    }
  }

  static Future<Map<String, dynamic>> uploadImage(String imagePath) async {
    var request = http.MultipartRequest('POST', Uri.parse('$flaskUrl/upload'));
    request.files.add(await http.MultipartFile.fromPath('file', imagePath));

    try {
      var response = await request.send();
      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        var decodedResponse = jsonDecode(responseBody) as Map<String, dynamic>;
        print('Image uploaded successfully.');
        return decodedResponse;
      } else {
        print('Image upload failed.');
        throw Exception('Failed to upload image: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Image upload failed: $e');
      throw Exception('Image upload failed: $e');
    }
  }

  // Fetch AI data from Flask server
  static Future<AiData> fetchAiData() async {
    final response = await http.get(Uri.parse('$flaskUrl/ai-data'));

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      return AiData.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load AI data');
    }
  }
}
