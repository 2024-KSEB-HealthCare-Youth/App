class UserData {
  final String loginId;
  final String password;
  final String name;
  final String gender;
  final int age;
  final String phoneNumber;
  final String? email;
  final String? profileImage;

  UserData({
    required this.loginId,
    required this.password,
    required this.name,
    required this.gender,
    required this.age,
    required this.phoneNumber,
    this.email,
    this.profileImage,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      loginId: json['loginId'],
      password: json['password'],
      name: json['name'],
      gender: json['gender'],
      age: json['age'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      profileImage: json['profileImage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'loginId': loginId,
      'password': password,
      'name': name,
      'gender': gender,
      'age': age,
      'phoneNumber': phoneNumber,
      'email': email,
      'profileImage': profileImage,
    };
  }
}
