// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AiDataImpl _$$AiDataImplFromJson(Map<String, dynamic> json) => _$AiDataImpl(
      cosNames:
          (json['cosNames'] as List<dynamic>).map((e) => e as String).toList(),
      cosPaths:
          (json['cosPaths'] as List<dynamic>).map((e) => e as String).toList(),
      nutrNames:
          (json['nutrNames'] as List<dynamic>).map((e) => e as String).toList(),
      nutrPaths:
          (json['nutrPaths'] as List<dynamic>).map((e) => e as String).toList(),
      simpleSkin: $enumDecode(_$BaseTypeEnumMap, json['simpleSkin']),
      expertSkin: (json['expertSkin'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$SkinTypeEnumMap, e))
          .toList(),
      probabilities: (json['probabilities'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
    );

Map<String, dynamic> _$$AiDataImplToJson(_$AiDataImpl instance) =>
    <String, dynamic>{
      'cosNames': instance.cosNames,
      'cosPaths': instance.cosPaths,
      'nutrNames': instance.nutrNames,
      'nutrPaths': instance.nutrPaths,
      'simpleSkin': _$BaseTypeEnumMap[instance.simpleSkin]!,
      'expertSkin':
          instance.expertSkin?.map((e) => _$SkinTypeEnumMap[e]!).toList(),
      'probabilities': instance.probabilities,
    };

const _$BaseTypeEnumMap = {
  BaseType.COMBINATION: 'COMBINATION',
  BaseType.OILY: 'OILY',
  BaseType.DRY: 'DRY',
};

const _$SkinTypeEnumMap = {
  SkinType.ACNE: 'ACNE',
  SkinType.WRINKLES: 'WRINKLES',
};
