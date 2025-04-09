// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriesModel _$CategoriesModelFromJson(Map<String, dynamic> json) =>
    CategoriesModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$CategoriesModelToJson(CategoriesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'image': instance.image,
    };
