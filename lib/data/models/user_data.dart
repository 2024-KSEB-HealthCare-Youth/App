import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data.freezed.dart';
part 'user_data.g.dart';

enum UserRole { USER, ADMIN }

@freezed
class UserData with _$UserData {
  const factory UserData({
    required String loginId,
    String? password, // Made nullable
    required String name,
    required String nickName,
    required String gender,
    required int age,
    String? phoneNumber,
    String? email,
    String? profileImage,
    @UserRoleConverter() UserRole? isAdmin, // Made nullable
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}

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
