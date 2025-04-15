import 'package:json_annotation/json_annotation.dart';

part 'product_by_occasion.g.dart';

@JsonSerializable()
class ProductByOccasion {
  String ?message;
  MetadataBean ?metadata;
  List<ProductsBean>? products;

  ProductByOccasion({this.message, this.metadata, this.products});

  factory ProductByOccasion.fromJson(Map<String, dynamic> json) => _$ProductByOccasionFromJson(json);

  Map<String, dynamic> toJson() => _$ProductByOccasionToJson(this);
}

@JsonSerializable()
class ProductsBean {
  String ?id;
  String ?title;
  String ?slug;
  String ?description;
  String ?imgCover;
  List<String>? images;
  num ?price;
  num ?priceAfterDiscount;
  num ?quantity;
  String ?category;
  String ?occasion;

  num? v;
  num ?discount;
  num ?sold;
  num ?rateAvg;
  num ?rateCount;
  String? id2;

  ProductsBean({this.id, this.title, this.slug, this.description, this.imgCover, this.images, this.price, this.priceAfterDiscount, this.quantity, this.category, this.occasion, this.v, this.discount, this.sold, this.rateAvg, this.rateCount, this.id2});

  factory ProductsBean.fromJson(Map<String, dynamic> json) => _$ProductsBeanFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsBeanToJson(this);
}

@JsonSerializable()
class MetadataBean {
  num? currentPage;
  num? totalPages;
  num ?limit;
  num ?totalItems;

  MetadataBean({this.currentPage, this.totalPages, this.limit, this.totalItems});

  factory MetadataBean.fromJson(Map<String, dynamic> json) => _$MetadataBeanFromJson(json);

  Map<String, dynamic> toJson() => _$MetadataBeanToJson(this);
}

