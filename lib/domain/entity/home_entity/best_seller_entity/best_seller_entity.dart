import 'package:json_annotation/json_annotation.dart';

class BestSellerEntity {
  BestSellerEntity({
    this.message,
    this.besstSeller,});


  String? message;
  List<BestSeller>? besstSeller;

}
@JsonSerializable()

class BestSeller {
  BestSeller({
  this.id,
  this.title,
  this.slug,
  this.description,
  this.imgCover,
  this.images,
  this.price,
  this.priceAfterDiscount,
  this.quantity,
  this.category,
  this.occasion,
  this.createdAt,
  this.updatedAt,
  this.v,
  this.discount,
  this.sold,
  this.rateAvg,
  this.rateCount,
  });

  String? id;
  String? title;
  String? slug;
  String? description;
  String? imgCover;
  List<String>? images;
  num? price;
  num? priceAfterDiscount;
  num? quantity;
  String? category;
  String? occasion;
  String? createdAt;
  String? updatedAt;
  num? v;
  num? discount;
  num? sold;
  num? rateAvg;
  num? rateCount;
  }