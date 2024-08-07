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
      simpleSkin: $enumDecode(_$BasicTypeEnumMap, json['simpleSkin']),
      expertSkin: (json['expertSkin'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$SkinTypeEnumMap, e))
          .toList(),
      resultImage: json['resultImage'] as String,
    );

Map<String, dynamic> _$$AiDataImplToJson(_$AiDataImpl instance) =>
    <String, dynamic>{
      'cosNames': instance.cosNames,
      'cosPaths': instance.cosPaths,
      'nutrNames': instance.nutrNames,
      'nutrPaths': instance.nutrPaths,
      'simpleSkin': _$BasicTypeEnumMap[instance.simpleSkin]!,
      'expertSkin':
          instance.expertSkin?.map((e) => _$SkinTypeEnumMap[e]!).toList(),
      'resultImage': instance.resultImage,
    };

const _$BasicTypeEnumMap = {
  BasicType.OILY: 'OILY',
  BasicType.DRY: 'DRY',
  BasicType.COMBINATION: 'COMBINATION',
};

const _$SkinTypeEnumMap = {
  SkinType.acne: 'acne',
  SkinType.wrinkle: 'wrinkle',
  SkinType.atophy: 'atophy',
};
