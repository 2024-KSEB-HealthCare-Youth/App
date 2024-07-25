// services/auth_service.dart

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/user_data.dart';
import '../utils/rest_api.dart';

class AuthService {
  Future<void> signUp(BuildContext context, UserData userData) async {
    try {
      await RestAPI.signUp(userData);
      print('Sign up successful');
      Navigator.pushNamed(context, '/login');
    } catch (e) {
      print('Sign up failed: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sign up failed: $e')),
      );
    }
  }

  int calculateAge(String birth) {
    int age;
    try {
      DateTime birthDate = DateFormat('MM/dd/yyyy').parse(birth);
      int calculatedAge = DateTime.now().year - birthDate.year;
      if (DateTime.now().isBefore(DateTime(
          birthDate.year + calculatedAge, birthDate.month, birthDate.day))) {
        calculatedAge--;
      }
      age = calculatedAge;
    } catch (e) {
      throw Exception('Invalid birth date format. Please use MM/DD/YYYY.');
    }
    return age;
  }
}
