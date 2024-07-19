class UserData {
  final String profileImagePath;
  final String name;
  final String nickName;
  final String gender;
  final String age;
  final String email;
  final String phone;
  final String skinType;

  UserData({
    this.profileImagePath = 'assets/images/default_profile.png',
    this.name = 'Unknown',
    this.nickName = 'Unknown',
    this.gender = 'Unknown',
    this.age = 'Unknown',
    this.email = 'Unknown',
    this.phone = 'Unknown',
    this.skinType = 'Unknown',
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      profileImagePath:
          json['profileImagePath'] ?? 'assets/images/default_profile.png',
      name: json['name'] ?? 'Unknown',
      nickName: json['nickName'] ?? 'Unknown',
      gender: json['gender'] ?? 'Unknown',
      age: json['age'] ?? 'Unknown',
      email: json['email'] ?? 'Unknown',
      phone: json['phone'] ?? 'Unknown',
      skinType: json['skinType'] ?? 'Unknown',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'profileImagePath': profileImagePath,
      'name': name,
      'nickName': nickName,
      'gender': gender,
      'age': age,
      'email': email,
      'phone': phone,
      'skinType': skinType,
    };
  }
}
