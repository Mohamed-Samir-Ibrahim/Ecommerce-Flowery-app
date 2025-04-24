// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CitiesResponseDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CitiesResponseDto _$CitiesResponseDtoFromJson(Map<String, dynamic> json) =>
    CitiesResponseDto(
      id: (json['id'] as num).toInt(),
      nameAr: json['nameAr'] as String,
      nameEn: json['nameEn'] as String,
    );

Map<String, dynamic> _$CitiesResponseDtoToJson(CitiesResponseDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameAr': instance.nameAr,
      'nameEn': instance.nameEn,
    };
