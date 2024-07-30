import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import '../models/user_data.dart';
import '../models/result_data.dart';
import '../models/ai_data.dart';
import '../models/token_response.dart';
import '../models/past_data.dart';
import '../models/post_data.dart';
import '../models/comment_data.dart';

class RestAPI {
  static const String baseUrl = 'http://52.79.103.61:8080';
  static const String flaskUrl = 'http://3.37.66.194:5000'; // Flask 서버 URL 수정
  static const Map<String, String> headers = {
    'Content-Type': 'application/json'
  };
  static final FlutterSecureStorage storage = FlutterSecureStorage();
  static final CookieJar cookieJar = CookieJar();
  static final Dio dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    headers: headers,
  ))
    ..interceptors.add(CookieManager(cookieJar));

  // Flask 서버와 통신을 위한 별도의 Dio 인스턴스
  static final Dio flaskDio = Dio(BaseOptions(
    baseUrl: flaskUrl,
    headers: headers,
  ));

  // Save loginId to shared preferences
  static Future<void> saveLoginId(String loginId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('loginId', loginId);
  }

  // Retrieve loginId from shared preferences
  static Future<String?> getLoginId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('loginId');
  }

  // Delete tokens from secure storage
  static Future<void> deleteTokens() async {
    await storage.delete(key: 'access_token');
    await storage.delete(key: 'refresh_token');
    await cookieJar.deleteAll();
  }

  // Login method
  static Future<void> login(String loginId, String password) async {
    final requestBody = jsonEncode({'loginId': loginId, 'password': password});
    print('Request body: $requestBody');

    try {
      final response = await dio.post(
        '/login',
        data: requestBody,
      );
      print('Response status: ${response.statusCode}');
      print('Response headers: ${response.headers}');
      print('Response body: ${response.data}');

      if (response.statusCode == 200) {
        await saveLoginId(loginId);
        print('Login successful.');
      } else {
        throw Exception('Failed to log in: ${response.statusMessage}');
      }
    } catch (e) {
      if (e is DioError && e.response?.statusCode == 401) {
        print('Login failed: Invalid credentials');
      } else {
        print('Login failed: $e');
      }
      throw Exception('Login failed: $e');
    }
  }

  static Future<UserData> fetchUserData(String memberId) async {
    try {
      final response = await dio.get('/members/$memberId');
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.data}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;
        final user = UserData.fromJson(responseData['results'][0]);
        return user;
      } else {
        throw Exception('Failed to fetch user data: ${response.statusMessage}');
      }
    } catch (e) {
      print('Fetch user data failed: $e');
      throw Exception('Fetch user data failed: $e');
    }
  }

  // Fetch result data
  static Future<ResultData> fetchResultData(String userId) async {
    try {
      final response = await dio.get(
        '/results/$userId',
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.data}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;
        return ResultData.fromJson(responseData);
      } else {
        throw Exception(
            'Failed to fetch result data: ${response.statusMessage}');
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
      final response = await dio.post(
        '/members/join',
        data: requestBody,
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.data}');

      if (response.statusCode == 200) {
        print('Sign up successful.');
      } else {
        throw Exception('Failed to sign up: ${response.statusMessage}');
      }
    } catch (e) {
      print('Sign up failed: $e');
      throw Exception('Sign up failed: $e');
    }
  }

  // Update user data
  static Future<void> updateUserData(UserData userData, String userId) async {
    final requestBody = jsonEncode(userData.toJson());
    print('Request body: $requestBody');

    try {
      final response = await dio.put(
        '/members/$userId',
        data: requestBody,
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.data}');

      if (response.statusCode == 200) {
        print('User data updated successfully.');
      } else {
        throw Exception(
            'Failed to update user data: ${response.statusMessage}');
      }
    } catch (e) {
      print('Update user data failed: $e');
      throw Exception('Update user data failed: $e');
    }
  }

  // Fetch past data
  static Future<PastData> fetchPastData(String userId) async {
    try {
      final response = await dio.get(
        '/results/lists',
      );

      if (response.statusCode == 200) {
        return PastData.fromJson(response.data);
      } else {
        throw Exception('Failed to load past data: ${response.statusMessage}');
      }
    } catch (e) {
      print('Fetch past data failed: $e');
      throw Exception('Fetch past data failed: $e');
    }
  }

  // Fecth past log by result id & result date
  static Future<ResultData> fetchPast_Result(String resultId) async {
    try {
      final response = await dio.get(
        '/results/$resultId',
      );
      if (response.statusCode == 200) {
        return ResultData.fromJson(response.data);
      } else {
        throw Exception(
            'Failed to load Past_Result data:${response.statusMessage}');
      }
    } catch (e) {
      print('Fetch past data failed: $e');
      throw Exception('Fetch past data failed: $e');
    }
  }

  //fetch postdata
  static Future<List<postData>> fetchPosts() async {
    try {
      final response = await dio.get(
        '/posts',
      );
      if (response.statusCode == 200) {
        List<dynamic> jsonData = response.data;
        List<postData> posts =
            jsonData.map((json) => postData.fromJson(json)).toList();
        return posts;
      } else {
        throw Exception('Failed to load posts: ${response.statusMessage}');
      }
    } catch (e) {
      print('Fetch posts failed: $e');
      throw Exception('Fetch posts failed: $e');
    }
  }

  // Save post data to the server
  static Future<bool> savePost(Map<String, dynamic> post) async {
    final requestBody = jsonEncode(post);
    print('Request body: $requestBody');

    try {
      final response = await dio.post(
        '/posts',
        data: requestBody,
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.data}');

      if (response.statusCode == 201) {
        return true;
      } else {
        throw Exception('Failed to save post: ${response.statusMessage}');
      }
    } catch (e) {
      print('Save post failed: $e');
      throw Exception('Save post failed: $e');
    }
  }

  //upload image to flask server
  static Future<Map<String, dynamic>> uploadImage(String imagePath) async {
    var formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(imagePath),
    });

    try {
      final response = await flaskDio.post(
        '/upload',
        data: formData,
      );
      if (response.statusCode == 200) {
        var decodedResponse = response.data as Map<String, dynamic>;
        print('Image uploaded successfully.');
        return decodedResponse;
      } else {
        print('Image upload failed.');
        throw Exception('Failed to upload image: ${response.statusMessage}');
      }
    } catch (e) {
      print('Image upload failed: $e');
      throw Exception('Image upload failed: $e');
    }
  }

  // Fetch AI data from Flask server
  static Future<AiData> fetchAiData() async {
    try {
      final response = await flaskDio.get('/ai-data');
      if (response.statusCode == 200) {
        return AiData.fromJson(response.data);
      } else {
        throw Exception('Failed to load AI data');
      }
    } catch (e) {
      print('Fetch AI data failed: $e');
      throw Exception('Fetch AI data failed: $e');
    }
  }

  // Add a comment to a post
  static Future<void> addCommentToPost(
      String postId, CommentData comment) async {
    final requestBody = jsonEncode(comment.toJson());
    print('Request body: $requestBody');

    try {
      final response = await dio.post(
        '/posts/$postId/comments',
        data: requestBody,
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.data}');

      if (response.statusCode != 201) {
        throw Exception('Failed to add comment: ${response.statusMessage}');
      }
    } catch (e) {
      print('Add comment failed: $e');
      throw Exception('Add comment failed: $e');
    }
  }

  // Update like status of a post
  static Future<void> updateLikeStatus(String postId, int likes) async {
    final requestBody = jsonEncode({'likes': likes});
    print('Request body: $requestBody');

    try {
      final response = await dio.put(
        '/posts/$postId/likes',
        data: requestBody,
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.data}');

      if (response.statusCode != 200) {
        throw Exception(
            'Failed to update like status: ${response.statusMessage}');
      }
    } catch (e) {
      print('Update like status failed: $e');
      throw Exception('Update like status failed: $e');
    }
  }
}
