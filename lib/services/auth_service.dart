import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../data/models/user_data.dart';
import '../utils/rest_api.dart';
import '../main.dart'; // 필요한 경우 import 추가
import '../data/dtos/login_dto.dart';

class AuthService {
  Future<void> signUp(BuildContext context, UserData userData) async {
    try {
      await RestAPI.signUp(userData);
      print('Sign up successful');
      Navigator.pushNamed(context, Routes.login);
    } catch (e) {
      print('Sign up failed: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sign up failed: $e')),
      );
    }
  }

  int calculateAge(String birth) {
    try {
      DateTime birthDate = DateFormat('MM/dd/yyyy').parse(birth);
      int age = DateTime.now().year - birthDate.year;
      if (DateTime.now().isBefore(
          DateTime(birthDate.year + age, birthDate.month, birthDate.day))) {
        age--;
      }
      return age;
    } catch (e) {
      throw Exception('Invalid birth date format. Please use MM/DD/YYYY.');
    }
  }

  Future<void> login(String loginId, String password) async {
    final loginDTO = LoginDTO(loginId: loginId, password: password);
    await RestAPI.login(loginDTO);
  }

  Future<void> logout(BuildContext context) async {
    try {
      await RestAPI.deleteTokens();
      print('Logout successful');
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.login, (route) => false);
    } catch (e) {
      print('Logout failed: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Logout failed: $e')),
      );
    }
  }
}
