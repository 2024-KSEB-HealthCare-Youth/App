import 'dart:convert';
import 'package:dio/dio.dart' as dio;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import '../data/models/user_data.dart';
import '../data/models/result_data.dart';
import '../data/models/ai_data.dart';
import '../data/models/past_data.dart';
import '../data/dtos/comment_dto.dart';
import '../data/dtos/login_dto.dart';
import '../data/dtos/recommend_dto.dart';
import '../data/dtos/post_get_dto.dart';
import '../data/dtos/onePostdetail_dto.dart';
import '../data/dtos/my_page_dto.dart';
import '../data/dtos/send_data_dto.dart';

class RestAPI {
  static const String baseUrl = 'http://52.79.103.61:8080';
  static const String flaskUrl = 'http://3.37.66.194:5000';
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

  static final dio.Dio flaskDio = dio.Dio(dio.BaseOptions(
    baseUrl: flaskUrl,
    headers: headers,
  ));

  static Future<void> saveLoginId(String loginId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('loginId', loginId);
  }

  static Future<String?> getLoginId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('loginId');
  }

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

        final authorizationHeader = response.headers['authorization']?.first;
        if (authorizationHeader != null) {
          final accessToken = authorizationHeader.replaceFirst('Bearer ', '');
          await storage.write(key: 'access_token', value: accessToken);
        }

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
        ),
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

  Future<OnepostdetailDTO> fetchPostById(int postId) async {
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
        if (response.data is Map<String, dynamic> &&
            response.data['results'] is List &&
            response.data['results'].isNotEmpty) {
          final Map<String, dynamic> postData = response.data['results'][0];

          // Print response data for debugging
          print('Response Data: $postData');

          // Parse JSON data
          final postDetail = OnepostdetailDTO.fromJson(postData);
          return postDetail;
        } else {
          throw Exception('Failed to load post: ${response.statusMessage}');
        }
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

  Future<SendDataDTO> sendDataToServer(AiData aiData) async {
    try {
      final token = await storage.read(key: 'access_token');
      final response = await dioClient.post(
        '/members/mypage',
        data: aiData.toJson(),
        options: dio.Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      if (response.statusCode == 200) {
        print('Data sent successfully.');

        if (response.data is Map<String, dynamic> && response.data['results'] is List) {
          List<dynamic> jsonData = response.data['results'];
          if (jsonData.isNotEmpty) {
            SendDataDTO data = SendDataDTO.fromJson(jsonData[0]);
            return data;
          } else {
            throw Exception('No data returned in response');
          }
        } else {
          throw Exception('Unexpected response format');
        }
      } else {
        print('Data sending failed.');
        throw Exception('Failed to send data: ${response.statusMessage}');
      }
    } catch (e) {
      print('Data sending failed: $e');
      throw Exception('Data sending failed: $e');
    }
  }


  static Future<RecommendDTO> fetchRecommendData() async {
    try {
      final token = await storage.read(key: 'access_token');
      final response = await dioClient.get(
        'path', // 서버의 경로를 입력하세요.
        options: dio.Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      if (response.statusCode == 200) {
        if (response.data is Map<String, dynamic> &&
            response.data['results'] is List) {
          List<dynamic> jsonData = response.data['results'];
          if (jsonData.isNotEmpty) {
            return RecommendDTO.fromJson(jsonData[0]);
          } else {
            throw Exception('No data returned in response');
          }
        } else {
          throw Exception('Unexpected response format');
        }
      } else {
        throw Exception('Failed to load RecommendDTO data: ${response.statusMessage}');
      }
    } catch (e) {
      print('Data fetching failed: $e');
      throw Exception('Data fetching failed: $e');
    }
  }



  static Future<bool> addCommentToPost(int postId, CommentDTO comment) async {
    final requestBody = jsonEncode(comment.toJson());
    print('Request body: $requestBody');

    try {
      final token = await storage.read(key: 'access_token');
      final response = await dioClient.post(
        '/comments/$postId',
        data: requestBody,
        options: dio.Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.data}');

      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception('Failed to add comment: ${response.statusMessage}');
      }
    } catch (e) {
      print('Add comment failed: $e');
      throw Exception('Add comment failed: $e');
    }
  }

  static Future<void> removeLikeStatus(int postId) async {
    try {
      final token = await storage.read(key: 'access_token');
      final response = await dioClient.delete(
        '/likes/$postId',
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

  static Future<void> updateLikeStatus(int postId) async {
    try {
      final token = await storage.read(key: 'access_token');
      final response = await dioClient.put(
        '/likes/$postId',
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
