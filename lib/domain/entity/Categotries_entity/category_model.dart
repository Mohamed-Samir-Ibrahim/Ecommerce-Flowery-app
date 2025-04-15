// ignore_for_file: camel_case_types
import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Category_response_entity {
  Category_response_entity({
    this.message,
    this.metadata,
    this.categories,
  });

  String? message;
  Metadata_entity? metadata; // Changed to Metadata_entity?
  List<Categories_entity>? categories;

  factory Category_response_entity.fromJson(Map<String, dynamic> json) =>
      _$Category_response_entityFromJson(json);
  Map<String, dynamic> toJson() => _$Category_response_entityToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Categories_entity {
  Categories_entity({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.productsCount,
  });

  String? id;
  String? name;
  String? slug;
  String? image;
  String? createdAt;
  String? updatedAt;
  int? productsCount;

  factory Categories_entity.fromJson(Map<String, dynamic> json) =>
      _$Categories_entityFromJson(json);
  Map<String, dynamic> toJson() => _$Categories_entityToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Metadata_entity {
  Metadata_entity({
    this.currentPage,
    this.limit,
    this.totalPages,
    this.totalItems,
  });

  int? currentPage;
  int? limit;
  int? totalPages;
  int? totalItems;

  factory Metadata_entity.fromJson(Map<String, dynamic> json) =>
      _$Metadata_entityFromJson(json);
  Map<String, dynamic> toJson() => _$Metadata_entityToJson(this);
}