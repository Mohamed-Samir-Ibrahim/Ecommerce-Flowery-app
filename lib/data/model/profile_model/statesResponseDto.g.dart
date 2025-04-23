// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statesResponseDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatesResponseDto _$StatesResponseDtoFromJson(Map<String, dynamic> json) =>
    StatesResponseDto(
      id: (json['id'] as num).toInt(),
      governorate_id: (json['governorate_id'] as num).toInt(),
      city_name_ar: json['city_name_ar'] as String,
      city_name_en: json['city_name_en'] as String,
    );

Map<String, dynamic> _$StatesResponseDtoToJson(StatesResponseDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'governorate_id': instance.governorate_id,
      'city_name_ar': instance.city_name_ar,
      'city_name_en': instance.city_name_en,
    };
