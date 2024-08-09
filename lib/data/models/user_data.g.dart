// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDataImpl _$$UserDataImplFromJson(Map<String, dynamic> json) =>
    _$UserDataImpl(
      loginId: json['loginId'] as String,
      password: json['password'] as String?,
      name: json['name'] as String?,
      nickName: json['nickName'] as String?,
      gender: json['gender'] as String,
      age: (json['age'] as num).toInt(),
      phoneNumber: json['phoneNumber'] as String?,
      email: json['email'] as String?,
      profileImage: json['profileImage'] as String?,
      isAdmin: _$JsonConverterFromJson<String, UserRole>(
          json['isAdmin'], const UserRoleConverter().fromJson),
    );

Map<String, dynamic> _$$UserDataImplToJson(_$UserDataImpl instance) =>
    <String, dynamic>{
      'loginId': instance.loginId,
      'password': instance.password,
      'name': instance.name,
      'nickName': instance.nickName,
      'gender': instance.gender,
      'age': instance.age,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'profileImage': instance.profileImage,
      'isAdmin': _$JsonConverterToJson<String, UserRole>(
          instance.isAdmin, const UserRoleConverter().toJson),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
