// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'occasions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OccasionsModel _$OccasionsModelFromJson(Map<String, dynamic> json) =>
    OccasionsModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$OccasionsModelToJson(OccasionsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'image': instance.image,
    };
