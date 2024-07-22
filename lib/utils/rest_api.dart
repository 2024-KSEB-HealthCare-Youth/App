import 'package:http/http.dart' as http;
import 'dart:convert';

class RestAPI {
  static const String baseUrl =
      'http://localhost:8080/swagger-ui/index.html#/member-controller';

  // 회원 가입 메서드
  static Future<void> signUp(Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$baseUrl/addMember'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to sign up: ${response.reasonPhrase}');
    }
  }

  // 로그인 메서드
  static Future<Map<String, dynamic>> login(
      String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to log in: ${response.reasonPhrase}');
    }
  }

  // 사용자 데이터 가져오기 메서드
  static Future<Map<String, dynamic>> fetchUserData(String userId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/user/$userId'),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch user data: ${response.reasonPhrase}');
    }
  }
}
