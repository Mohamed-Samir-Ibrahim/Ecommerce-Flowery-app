
import 'package:flowery/data/model/home_model/product_model/product_response_dto.dart';

import 'package:flowery/domain/entity/home_entity/best_seller_entity/best_seller_entity.dart';
import 'package:json_annotation/json_annotation.dart';
@JsonSerializable()
class BestSellerResponseDto extends BestSellerEntity {
  BestSellerResponseDto({
      super.message,
      super.besstSeller,});

  BestSellerResponseDto.fromJson(dynamic json) {
    message = json['message'];
    if (json['bestSeller'] != null) {
      besstSeller = [];
      json['bestSeller'].forEach((v) {
        besstSeller?.add(BestSellerDto.fromJson(v));
      });
    }
  }




}
@JsonSerializable()
class BestSellerDto extends BestSeller {
  BestSellerDto({
    super.id,
    super.title,
    super.slug,
    super.description,
    super.imgCover,
    super.images,
    super.price,
    super.priceAfterDiscount,
    super.quantity,
    super.category,
    super.occasion,
    super.createdAt,
    super.updatedAt,
    super.v,
    super.discount,
    super.sold,
    super.rateAvg,
      super.rateCount,

      this.productDto,


      });

  BestSellerDto.fromJson(dynamic json) {
    id = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    imgCover = json['imgCover'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    price = json['price'];
    priceAfterDiscount = json['priceAfterDiscount'];
    quantity = json['quantity'];
    category = json['category'];
    occasion = json['occasion'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    discount = json['discount'];
    sold = json['sold'];
    rateAvg = json['rateAvg'];
    rateCount = json['rateCount'];
    id = json['id'];

    productDto = json['products'] != null ? ProductDto.fromJson(json['products']) : null;


  }
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

  ProductDto? productDto;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['title'] = title;
    map['slug'] = slug;
    map['description'] = description;
    map['imgCover'] = imgCover;
    map['images'] = images;
    map['price'] = price;
    map['priceAfterDiscount'] = priceAfterDiscount;
    map['quantity'] = quantity;
    map['category'] = category;
    map['occasion'] = occasion;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    map['discount'] = discount;
    map['sold'] = sold;
    map['rateAvg'] = rateAvg;
    map['rateCount'] = rateCount;
    map['id'] = id;

    map['products'] = productDto;


    return map;
  }

}