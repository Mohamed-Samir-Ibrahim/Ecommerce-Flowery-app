// ignore_for_file: camel_case_types, overridden_fields, annotate_overrides

import 'package:flowery/domain/entity/Categotries_entity/category_model.dart' show Categories_entity, Category_response_entity, Metadata_entity;

class Category_response_DM extends Category_response_entity {
  Category_response_DM({
    super.message,
    super.metadata,
    super.categories,
  });

  String? message;
  Metadata_entity? metadata; // Fixed type to Metadata_entity
  List<Categories_entity>? categories;
}

class Categories_DM extends Categories_entity {
  Categories_DM({
    super.id,
    super.name,
    super.slug,
    super.image,
    super.createdAt,
    super.updatedAt,
    super.productsCount,
  });

  String? id;
  String? name;
  String? slug;
  String? image;
  String? createdAt;
  String? updatedAt;
  int? productsCount;
}

class Metadata_response_DM extends Metadata_entity {
  Metadata_response_DM({
    super.currentPage,
    super.limit,
    super.totalPages,
    super.totalItems,
  });

  int? currentPage;
  int? limit;
  int? totalPages;
  int? totalItems;
}