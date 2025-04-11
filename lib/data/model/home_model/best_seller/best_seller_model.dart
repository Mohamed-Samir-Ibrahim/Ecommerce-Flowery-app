
import 'package:json_annotation/json_annotation.dart';
part 'best_seller_model.g.dart';

@JsonSerializable()
class BestSellerModel {
  String ?id;
  String ?title;
  String ?slug;
  String? description;
  String ?imgCover;
  List<String>? images;
  num ?price;
  num ?priceAfterDiscount;
  num ?quantity;
  String? category;
  String ?occasion;
  num ?v;
  num ?discount;
  num ?sold;
  num ?rateAvg;
  num ?rateCount;
  String? id2;

  BestSellerModel({this.id, this.title, this.slug, this.description, this.imgCover, this.images, this.price, this.priceAfterDiscount, this.quantity, this.category, this.occasion, this.v, this.discount, this.sold, this.rateAvg, this.rateCount, this.id2});

  factory BestSellerModel.fromJson(Map<String, dynamic> json) => _$BestSellerModelFromJson(json);

  Map<String, dynamic> toJson() => _$BestSellerModelToJson(this);
}