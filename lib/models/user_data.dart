class UserData {
  final String profileImage;
  final String name;
  final String nickName;
  final String gender;
  final int age; // age should be an int, not a String
  final String email;
  final String phoneNumber;
  final String skinType;

  UserData({
    this.profileImage = 'assets/images/default_profile.png',
    this.name = 'Unknown',
    this.nickName = 'Unknown',
    this.gender = 'Unknown',
    this.age = 0, // default to 0 for int
    this.email = 'Unknown',
    this.phoneNumber = 'Unknown',
    this.skinType = 'Unknown',
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      profileImage: json['profileImage'] ?? 'assets/images/default_profile.png',
      name: json['name'] ?? 'Unknown',
      nickName: json['nickName'] ?? 'Unknown',
      gender: json['gender'] ?? 'Unknown',
      age: json['age'] ?? 0, // ensure age is treated as an int
      email: json['email'] ?? 'Unknown',
      phoneNumber: json['phoneNumber'] ?? 'Unknown',
      skinType: json['skinType'] ?? 'Unknown',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'profileImage': profileImage,
      'name': name,
      'nickName': nickName,
      'gender': gender,
      'age': age,
      'email': email,
      'phoneNumber': phoneNumber,
      'skinType': skinType,
    };
  }
}
