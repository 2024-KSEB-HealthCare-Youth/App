// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostUserDTOImpl _$$PostUserDTOImplFromJson(Map<String, dynamic> json) =>
    _$PostUserDTOImpl(
      loginId: json['loginId'] as String,
      profileImage: json['profileImage'] as String?,
      nickName: json['nickName'] as String?,
    );

Map<String, dynamic> _$$PostUserDTOImplToJson(_$PostUserDTOImpl instance) =>
    <String, dynamic>{
      'loginId': instance.loginId,
      'profileImage': instance.profileImage,
      'nickName': instance.nickName,
    };
