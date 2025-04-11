// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category_response_entity _$Category_response_entityFromJson(
  Map<String, dynamic> json,
) => Category_response_entity(
  message: json['message'] as String?,
  metadata:
      json['metadata'] == null
          ? null
          : Metadata_entity.fromJson(json['metadata'] as Map<String, dynamic>),
  categories:
      (json['categories'] as List<dynamic>?)
          ?.map((e) => Categories_entity.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$Category_response_entityToJson(
  Category_response_entity instance,
) => <String, dynamic>{
  'message': instance.message,
  'metadata': instance.metadata?.toJson(),
  'categories': instance.categories?.map((e) => e.toJson()).toList(),
};

Categories_entity _$Categories_entityFromJson(Map<String, dynamic> json) =>
    Categories_entity(
      id: json['id'] as String?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      image: json['image'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      productsCount: (json['productsCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$Categories_entityToJson(Categories_entity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'image': instance.image,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'productsCount': instance.productsCount,
    };

Metadata_entity _$Metadata_entityFromJson(Map<String, dynamic> json) =>
    Metadata_entity(
      currentPage: (json['currentPage'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
      totalPages: (json['totalPages'] as num?)?.toInt(),
      totalItems: (json['totalItems'] as num?)?.toInt(),
    );

Map<String, dynamic> _$Metadata_entityToJson(Metadata_entity instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'limit': instance.limit,
      'totalPages': instance.totalPages,
      'totalItems': instance.totalItems,
    };
