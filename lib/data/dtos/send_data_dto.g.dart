// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SendDataDTOImpl _$$SendDataDTOImplFromJson(Map<String, dynamic> json) =>
    _$SendDataDTOImpl(
      name: json['name'] as String,
      nickname: json['nickname'] as String,
      gender: json['gender'] as String,
      age: (json['age'] as num).toInt(),
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String,
      resultImage: json['resultImage'] as String,
      resultDetails: json['resultDetails'] as String?,
      advancedSkinType: (json['advancedSkinType'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$skinTypeEnumMap, e))
          .toList(),
      basicSkinType: json['basicSkinType'] as String,
    );

Map<String, dynamic> _$$SendDataDTOImplToJson(_$SendDataDTOImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'nickname': instance.nickname,
      'gender': instance.gender,
      'age': instance.age,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'resultImage': instance.resultImage,
      'resultDetails': instance.resultDetails,
      'advancedSkinType':
          instance.advancedSkinType?.map((e) => _$skinTypeEnumMap[e]!).toList(),
      'basicSkinType': instance.basicSkinType,
    };

const _$skinTypeEnumMap = {
  skinType.ACNE: 'ACNE',
  skinType.WRINKLE: 'WRINKLE',
  skinType.ATOPHY: 'ATOPHY',
};
