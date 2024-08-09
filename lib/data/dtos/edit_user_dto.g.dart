// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EditUserDTOImpl _$$EditUserDTOImplFromJson(Map<String, dynamic> json) =>
    _$EditUserDTOImpl(
      name: json['name'] as String?,
      nickName: json['nickName'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      profileImage: json['profileImage'] as String?,
    );

Map<String, dynamic> _$$EditUserDTOImplToJson(_$EditUserDTOImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'nickName': instance.nickName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'profileImage': instance.profileImage,
    };
