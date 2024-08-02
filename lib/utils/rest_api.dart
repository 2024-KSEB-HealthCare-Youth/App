import 'dart:convert';
import 'package:dio/dio.dart' as dio;
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import '../data/models/user_data.dart';
import '../data/models/result_data.dart';
import '../data/models/ai_data.dart';
import '../data/models/past_data.dart';
import '../data/models/post_data.dart';
import '../data/dtos/comment_dto.dart';
import '../data/dtos/login_dto.dart';
import '../data/dtos/comment_get_dto.dart';
import '../data/dtos/post_get_dto.dart';
import '../data/dtos/onePostdetail_dto.dart';

class RestAPI {
  static const String baseUrl = 'http://52.79.103.61:8080';
  static const String flaskUrl = 'http://3.37.66.194:5000'; // Flask 서버 URL 수정
  static const Map<String, String> headers = {
    'Content-Type': 'application/json'
  };
  static final FlutterSecureStorage storage = FlutterSecureStorage();
  static final CookieJar cookieJar = CookieJar();
  static final dio.Dio dioClient = dio.Dio(dio.BaseOptions(
    baseUrl: baseUrl,
    headers: headers,
  ))
    ..interceptors.add(CookieManager(cookieJar));

  // Flask 서버와 통신을 위한 별도의 Dio 인스턴스
  static final dio.Dio flaskDio = dio.Dio(dio.BaseOptions(
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


  static Future<void> login(LoginDTO loginDTO) async {
    final requestBody = jsonEncode(loginDTO.toJson());
    print('Request body: $requestBody');

    try {
      final response = await dioClient.post(
        '/login',
        data: requestBody,
      );
      print('Response status: ${response.statusCode}');
      print('Response headers: ${response.headers}');
      print('Response body: ${response.data}');

      if (response.statusCode == 200) {
        await saveLoginId(loginDTO.loginId);

        // 응답에서 Authorization 헤더 추출
        final authorizationHeader = response.headers['authorization']?.first;
        if (authorizationHeader != null) {
          final accessToken = authorizationHeader.replaceFirst('Bearer ', '');
          await storage.write(key: 'access_token', value: accessToken);
        }

        // 응답에서 set-cookie 헤더 추출
        final setCookieHeader = response.headers['set-cookie']?.first;
        if (setCookieHeader != null) {
          final refreshToken = setCookieHeader.split(';').firstWhere(
                  (part) => part.trim().startsWith('refresh='),
              orElse: () => '').replaceFirst('refresh=', '');
          if (refreshToken.isNotEmpty) {
            await storage.write(key: 'refresh_token', value: refreshToken);
          }
        }

        print('Login successful.');
      } else {
        throw Exception('Failed to log in: ${response.statusMessage}');
      }
    } catch (e) {
      if (e is dio.DioError && e.response?.statusCode == 401) {
        print('Login failed: Invalid credentials');
      } else {
        print('Login failed: $e');
      }
      throw Exception('Login failed: $e');
    }
  }

  static Future<UserData> fetchUserData() async {
    try {
      // 저장된 액세스 토큰을 읽어옴
      final token = await storage.read(key: 'access_token');
      if (token == null) {
        throw Exception('No access token found');
      }

      final response = await dioClient.get(
        '/members/me',
        options: dio.Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.data}');

      if (response.statusCode == 200) {
        // Ensure the response format is as expected
        if (response.data is Map<String, dynamic> &&
            response.data['results'] is List &&
            response.data['results'].isNotEmpty) {
          final Map<String, dynamic> responseData = response.data;
          final user = UserData.fromJson(responseData['results'][0]);
          return user;
        } else {
          throw Exception('Unexpected response format');
        }
      } else {
        throw Exception('Failed to fetch user data: ${response.statusMessage}');
      }
    } catch (e) {
      print('Fetch user data failed: $e');
      throw Exception('Fetch user data failed: $e');
    }
  }

  // Fetch result data
  static Future<ResultData> fetchResultData(String resultId) async {
    try {
      final token = await storage.read(key: 'access_token');
      if (token == null) {
        throw Exception('No access token found');
      }
      final response = await dioClient.get(
        '/results/$resultId',
        options: dio.Options(
          headers: {
            'Authorization': 'Bearer $token',
          }
        )
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
      final response = await dioClient.post(
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

  static Future<void> updateUserData(Map<String, dynamic> updatedUser) async {
    final memberId = updatedUser['loginId'];
    final requestBody = jsonEncode(updatedUser);
    print('Request body: $requestBody');

    try {
      final response = await dioClient.put(
        '/members/$memberId',
        data: requestBody,
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.data}');

      if (response.statusCode != 200) {
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
      final response = await dioClient.get(
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
      final response = await dioClient.get(
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

  static Future<OnepostdetailDTO> fetchPostById(String postId) async {
    try {
      final token = await storage.read(key: 'access_token');
      final response = await dioClient.get('/posts/$postId',
          options: dio.Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
          ),
          ); 
      if (response.statusCode == 200) {
        return OnepostdetailDTO.fromJson(response.data);
      } else {
        throw Exception('Failed to load post: ${response.statusMessage}');
      }
    } catch (e) {
      print('Fetch post failed: $e');
      throw Exception('Fetch post failed: $e');
    }
  }

  static Future<List<PostGetDTO>> fetchPostGet() async {
    try {
      final response = await dioClient.get('/posts');
      if (response.statusCode == 200) {
        // Check if the response format is as expected
        if (response.data is Map<String, dynamic> &&
            response.data['results'] is List) {
          List<dynamic> jsonData = response.data['results'];
          List<PostGetDTO> posts =
          jsonData.map((json) => PostGetDTO.fromJson(json)).toList();
          return posts;
        } else {
          throw Exception('Unexpected response format');
        }
      } else {
        throw Exception('Failed to load PostGet data: ${response.statusMessage}');
      }
    } catch (e) {
      print('Fetch PostGet data failed: $e');
      throw Exception('Fetch PostGet data failed: $e');
    }
  }

  // Save post data to the server
  static Future<bool> savePost(Map<String, dynamic> post) async {
    final requestBody = jsonEncode(post);
    print('Request body: $requestBody');

    try {
      final token = await storage.read(key: 'access_token');
      final response = await dioClient.post(
        '/posts',
        data: requestBody,
        options: dio.Options(
          headers: {'Authorization': 'Bearer $token',}
        )
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.data}');

      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception('Failed to save post: ${response.statusMessage}');
      }
    } catch (e) {
      print('Save post failed: $e');
      throw Exception('Save post failed: $e');
    }
  }

  // Upload image to flask server
  static Future<AiData> uploadImage(String imagePath) async {
    var formData = dio.FormData.fromMap({
      'file': await dio.MultipartFile.fromFile(imagePath),
    });

    try {
      final response = await flaskDio.post(
        '/upload',
        data: formData,
      );
      if (response.statusCode == 200) {
        var decodedResponse = response.data as Map<String, dynamic>;
        print('Image uploaded successfully.');
        return AiData.fromJson(decodedResponse);
      } else {
        print('Image upload failed.');
        throw Exception('Failed to upload image: ${response.statusMessage}');
      }
    } catch (e) {
      print('Image upload failed: $e');
      throw Exception('Image upload failed: $e');
    }
  }

  // Fetch AI data from springboot server
  static Future<AiData> fetchAiData() async {
    try {
      final response = await dioClient.get('/ai-data');
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
  static Future<CommentDTO> addCommentToPost(
      String postId, CommentDTO comment) async {
    final requestBody = jsonEncode(comment.toJson());
    print('Request body: $requestBody');

    try {
      final response = await dioClient.post(
        '/posts/$postId/comments',
        data: requestBody,
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.data}');

      if (response.statusCode == 201) {
        return CommentDTO.fromJson(response.data);
      } else {
        throw Exception('Failed to add comment: ${response.statusMessage}');
      }
    } catch (e) {
      print('Add comment failed: $e');
      throw Exception('Add comment failed: $e');
    }
  }

  // Get comments of a post
  static Future<List<CommentGetDTO>> getComments(String postId) async {
    try {
      final response = await dioClient.get('/posts/$postId/comments');
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.data}');

      if (response.statusCode == 200) {
        List<dynamic> jsonData = response.data;
        List<CommentGetDTO> comments =
            jsonData.map((json) => CommentGetDTO.fromJson(json)).toList();
        return comments;
      } else {
        throw Exception('Failed to load comments: ${response.statusMessage}');
      }
    } catch (e) {
      print('Get comments failed: $e');
      throw Exception('Get comments failed: $e');
    }
  }

  static Future<void> removeLikeStatus(String token) async {
    try {
      final response = await dioClient.delete(
        '/posts/likes',
        options: dio.Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode != 200) {
        throw Exception('Failed to remove like status: ${response.statusMessage}');
      }
    } catch (e) {
      print('Remove like status failed: $e');
      throw Exception('Remove like status failed: $e');
    }
  }

  static Future<void> updateLikeStatus(String token) async {
    try {
      final response = await dioClient.put(
        '/posts/likes',
        options: dio.Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode != 200) {
        throw Exception('Failed to update like status: ${response.statusMessage}');
      }
    } catch (e) {
      print('Update like status failed: $e');
      throw Exception('Update like status failed: $e');
    }
  }
}
