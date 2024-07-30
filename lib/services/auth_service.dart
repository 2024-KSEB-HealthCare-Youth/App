import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/user_data.dart';
import '../utils/rest_api.dart';
import '../main.dart'; // 필요한 경우 import 추가

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

  Future<void> login(
      BuildContext context, String loginId, String password) async {
    try {
      await RestAPI.login(loginId, password);
      print('Login successful');
      Navigator.pushNamed(context, Routes.mainPage);
    } catch (e) {
      print('Login failed: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed: $e')),
      );
    }
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

  Future<void> updateUser(
      BuildContext context, UserData userData, String userId) async {
    try {
      await RestAPI.updateUserData(userData, userId);
      print('User data updated successfully');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User data updated successfully')),
      );
    } catch (e) {
      print('Update user data failed: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Update user data failed: $e')),
      );
    }
  }
}
