// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommend_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecommendDTOImpl _$$RecommendDTOImplFromJson(Map<String, dynamic> json) =>
    _$RecommendDTOImpl(
      name: json['name'] as String,
      cosNames:
          (json['cosNames'] as List<dynamic>).map((e) => e as String).toList(),
      cosPaths:
          (json['cosPaths'] as List<dynamic>).map((e) => e as String).toList(),
      nutrNames:
          (json['nutrNames'] as List<dynamic>).map((e) => e as String).toList(),
      nutrPaths:
          (json['nutrPaths'] as List<dynamic>).map((e) => e as String).toList(),
      simpleSkin: $enumDecode(_$TypeEnumMap, json['simpleSkin']),
      expertSkin: (json['expertSkin'] as List<dynamic>)
          .map((e) => $enumDecode(_$SkinTypeEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$$RecommendDTOImplToJson(_$RecommendDTOImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'cosNames': instance.cosNames,
      'cosPaths': instance.cosPaths,
      'nutrNames': instance.nutrNames,
      'nutrPaths': instance.nutrPaths,
      'simpleSkin': _$TypeEnumMap[instance.simpleSkin]!,
      'expertSkin':
          instance.expertSkin.map((e) => _$SkinTypeEnumMap[e]!).toList(),
    };

const _$TypeEnumMap = {
  Type.DRY: 'DRY',
  Type.OILY: 'OILY',
  Type.COMBINATION: 'COMBINATION',
};

const _$SkinTypeEnumMap = {
  SkinType.ACNE: 'ACNE',
  SkinType.WRINKLE: 'WRINKLE',
  SkinType.ATOPHY: 'ATOPHY',
};
