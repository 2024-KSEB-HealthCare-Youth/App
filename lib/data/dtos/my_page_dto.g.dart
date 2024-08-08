// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_page_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyPageDTOImpl _$$MyPageDTOImplFromJson(Map<String, dynamic> json) =>
    _$MyPageDTOImpl(
      profileImage: json['profileImage'] as String?,
      name: json['name'] as String,
      gender: json['gender'] as String,
      age: (json['age'] as num).toInt(),
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String,
      loginId: json['loginId'] as String,
      simpleSkin: json['simpleSkin'] as String,
      resultDetails: json['resultDetails'] as String,
      probabilities: (json['probabilities'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
    );

Map<String, dynamic> _$$MyPageDTOImplToJson(_$MyPageDTOImpl instance) =>
    <String, dynamic>{
      'profileImage': instance.profileImage,
      'name': instance.name,
      'gender': instance.gender,
      'age': instance.age,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'loginId': instance.loginId,
      'simpleSkin': instance.simpleSkin,
      'resultDetails': instance.resultDetails,
      'probabilities': instance.probabilities,
    };
