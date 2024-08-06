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
      simpleSkin: json['simpleSkin'] as String,
      expertSkin: _$JsonConverterFromJson<List<String>, List<SkinType>>(
          json['expertSkin'], const SkinTypeListConverter().fromJson),
      resultImage: json['resultImage'] as String,
    );

Map<String, dynamic> _$$AiDataImplToJson(_$AiDataImpl instance) =>
    <String, dynamic>{
      'cosNames': instance.cosNames,
      'cosPaths': instance.cosPaths,
      'nutrNames': instance.nutrNames,
      'nutrPaths': instance.nutrPaths,
      'simpleSkin': instance.simpleSkin,
      'expertSkin': _$JsonConverterToJson<List<String>, List<SkinType>>(
          instance.expertSkin, const SkinTypeListConverter().toJson),
      'resultImage': instance.resultImage,
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
