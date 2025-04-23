// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_by_occasion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductByOccasion _$ProductByOccasionFromJson(Map<String, dynamic> json) =>
    ProductByOccasion(
      message: json['message'] as String?,
      metadata:
          json['metadata'] == null
              ? null
              : MetadataBean.fromJson(json['metadata'] as Map<String, dynamic>),
      products:
          (json['products'] as List<dynamic>?)
              ?.map((e) => ProductsBean.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$ProductByOccasionToJson(ProductByOccasion instance) =>
    <String, dynamic>{
      'message': instance.message,
      'metadata': instance.metadata,
      'products': instance.products,
    };

ProductsBean _$ProductsBeanFromJson(Map<String, dynamic> json) =>
    ProductsBean(
        id: json['id'] as String?,
        title: json['title'] as String?,
        slug: json['slug'] as String?,
        description: json['description'] as String?,
        imgCover: json['imgCover'] as String?,
        images:
            (json['images'] as List<dynamic>?)
                ?.map((e) => e as String)
                .toList(),
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
      )
      ..createdAt = json['createdAt'] as String?
      ..updatedAt = json['updatedAt'] as String?;

Map<String, dynamic> _$ProductsBeanToJson(ProductsBean instance) =>
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
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'v': instance.v,
      'discount': instance.discount,
      'sold': instance.sold,
      'rateAvg': instance.rateAvg,
      'rateCount': instance.rateCount,
      'id2': instance.id2,
    };

MetadataBean _$MetadataBeanFromJson(Map<String, dynamic> json) => MetadataBean(
  currentPage: json['currentPage'] as num?,
  totalPages: json['totalPages'] as num?,
  limit: json['limit'] as num?,
  totalItems: json['totalItems'] as num?,
);

Map<String, dynamic> _$MetadataBeanToJson(MetadataBean instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'totalPages': instance.totalPages,
      'limit': instance.limit,
      'totalItems': instance.totalItems,
    };
