import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  String profileImagePath;
  String name;
  String nickName;
  String gender;
  String age;
  String email;
  String phone;
  String skintype;

  UserData({
    this.profileImagePath = 'assets/images/default_profile.png',
    this.name = 'ba',
    this.nickName = 'babo',
    this.gender = 'male',
    this.age = '21',
    this.email = 'lsadkjfls@alskdfj.com',
    this.phone = '0256846543',
    this.skintype = 'dry & wrinkle',
  });

  Future<void> saveUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('profileImagePath', profileImagePath);
    await prefs.setString('name', name);
    await prefs.setString('nickName', nickName);
    await prefs.setString('gender', gender);
    await prefs.setString('age', age);
    await prefs.setString('email', email);
    await prefs.setString('phone', phone);
    await prefs.setString('skintype', skintype);
  }

  Future<void> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    profileImagePath = prefs.getString('profileImagePath') ??
        'assets/images/default_profile.png';
    name = prefs.getString('name') ?? 'Unknown';
    nickName = prefs.getString('nickName') ?? 'Unknown';
    gender = prefs.getString('gender') ?? 'Unknown';
    age = prefs.getString('age') ?? 'Unknown';
    email = prefs.getString('email') ?? 'Unknown';
    phone = prefs.getString('phone') ?? 'Unknown';
    skintype = prefs.getString('skintype') ?? 'Unknown';
  }
}
