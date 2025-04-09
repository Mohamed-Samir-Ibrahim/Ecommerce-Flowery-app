// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'best_seller_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BestSellerModel _$BestSellerModelFromJson(Map<String, dynamic> json) =>
    BestSellerModel(
      id: json['id'] as String?,
      title: json['title'] as String?,
      slug: json['slug'] as String?,
      description: json['description'] as String?,
      imgCover: json['imgCover'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      price: json['price'] as num?,
      priceAfterDiscount: json['priceAfterDiscount'] as num?,
      quantity: json['quantity'] as num?,
      category: json['category'] as String?,
      occasion: json['occasion'] as String?,
      v: json['v'] as num?,
      discount: json['discount'] as num?,
      sold: json['sold'] as num?,
      rateAvg: json['rateAvg'] as num?,
      rateCount: json['rateCount'] as num?,
      id2: json['id2'] as String?,
    );

Map<String, dynamic> _$BestSellerModelToJson(BestSellerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'description': instance.description,
      'imgCover': instance.imgCover,
      'images': instance.images,
      'price': instance.price,
      'priceAfterDiscount': instance.priceAfterDiscount,
      'quantity': instance.quantity,
      'category': instance.category,
      'occasion': instance.occasion,
      'v': instance.v,
      'discount': instance.discount,
      'sold': instance.sold,
      'rateAvg': instance.rateAvg,
      'rateCount': instance.rateCount,
      'id2': instance.id2,
    };
