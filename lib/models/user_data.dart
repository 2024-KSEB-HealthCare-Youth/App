class UserData {
  final String loginId;
  final String password;
  final String name;
  final String? nickName;
  final String gender;
  final int age;
  final String phoneNumber;
  final String? email;
  final String? profileImage;
  final String? isAdmin;

  UserData({
    required this.loginId,
    required this.password,
    required this.name,
    this.nickName,
    required this.gender,
    required this.age,
    required this.phoneNumber,
    this.email,
    this.profileImage,
    this.isAdmin,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      loginId: json['loginId'],
      password: json['password'],
      name: json['name'],
      nickName: json['nickName'],
      gender: json['gender'],
      age: json['age'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      profileImage: json['profileImage'],
      isAdmin: json['isAdmin'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'loginId': loginId,
      'password': password,
      'name': name,
      'nickName': nickName,
      'gender': gender,
      'age': age,
      'phoneNumber': phoneNumber,
      'email': email,
      'profileImage': profileImage,
      'isAdmin': isAdmin,
    };
  }
}
