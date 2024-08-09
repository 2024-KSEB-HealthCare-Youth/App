// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommend_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecommendDTOImpl _$$RecommendDTOImplFromJson(Map<String, dynamic> json) =>
    _$RecommendDTOImpl(
      name: json['name'] as String?,
      basicSkinType:
          $enumDecode(_$SkinConditionTypeEnumMap, json['basicSkinType']),
      advancedSkinType: (json['advancedSkinType'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$SkinTypeEnumMap, e))
          .toList(),
      cosNames:
          (json['cosNames'] as List<dynamic>).map((e) => e as String).toList(),
      cosPaths:
          (json['cosPaths'] as List<dynamic>).map((e) => e as String).toList(),
      nutrNames:
          (json['nutrNames'] as List<dynamic>).map((e) => e as String).toList(),
      nutrPaths:
          (json['nutrPaths'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$RecommendDTOImplToJson(_$RecommendDTOImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'basicSkinType': _$SkinConditionTypeEnumMap[instance.basicSkinType]!,
      'advancedSkinType':
          instance.advancedSkinType?.map((e) => _$SkinTypeEnumMap[e]!).toList(),
      'cosNames': instance.cosNames,
      'cosPaths': instance.cosPaths,
      'nutrNames': instance.nutrNames,
      'nutrPaths': instance.nutrPaths,
    };

const _$SkinConditionTypeEnumMap = {
  SkinConditionType.DRY: 'DRY',
  SkinConditionType.OILY: 'OILY',
  SkinConditionType.COMBINATION: 'COMBINATION',
};

const _$SkinTypeEnumMap = {
  SkinType.ACNE: 'ACNE',
  SkinType.WRINKLES: 'WRINKLES',
};
