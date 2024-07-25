import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data.freezed.dart';
part 'user_data.g.dart';

enum UserRole { USER, ADMIN }

@freezed
class UserData with _$UserData {
  const factory UserData({
    required String loginId,
    required String password,
    required String name,
    String? nickName,
    required String gender,
    required int age,
    required String phoneNumber,
    String? email,
    String? profileImage,
    required UserRole isAdmin,
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}

// The following lines ensure the enum is properly serialized/deserialized
const _userRoleValues = <String, UserRole>{
  'USER': UserRole.USER,
  'ADMIN': UserRole.ADMIN,
};

UserRole _$UserRoleFromJson(String json) {
  return _userRoleValues[json]!;
}

String _$UserRoleToJson(UserRole role) {
  return role.toString().split('.').last;
}

class UserRoleConverter implements JsonConverter<UserRole, String> {
  const UserRoleConverter();

  @override
  UserRole fromJson(String json) {
    return _$UserRoleFromJson(json);
  }

  @override
  String toJson(UserRole role) {
    return _$UserRoleToJson(role);
  }
}
