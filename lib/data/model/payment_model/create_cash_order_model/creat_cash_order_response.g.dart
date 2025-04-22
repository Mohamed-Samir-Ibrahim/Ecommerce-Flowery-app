// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creat_cash_order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatCashOrderResponse _$CreatCashOrderResponseFromJson(
  Map<String, dynamic> json,
) => CreatCashOrderResponse(
  message: json['message'] as String?,
  order:
      json['order'] == null
          ? null
          : OrderBean.fromJson(json['order'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CreatCashOrderResponseToJson(
  CreatCashOrderResponse instance,
) => <String, dynamic>{'message': instance.message, 'order': instance.order};

OrderBean _$OrderBeanFromJson(Map<String, dynamic> json) => OrderBean(
  user: json['user'] as String?,
  orderItems:
      (json['orderItems'] as List<dynamic>?)
          ?.map((e) => OrderItemsBean.fromJson(e as Map<String, dynamic>))
          .toList(),
  totalPrice: json['totalPrice'] as num?,
  paymentType: json['paymentType'] as String?,
  isPaid: json['isPaid'] as bool?,
  isDelivered: json['isDelivered'] as bool?,
  state: json['state'] as String?,
  id: json['_id'] as String?,
  orderNumber: json['orderNumber'] as String?,
  v: json['__v'] as num?,
);

Map<String, dynamic> _$OrderBeanToJson(OrderBean instance) => <String, dynamic>{
  'user': instance.user,
  'orderItems': instance.orderItems,
  'totalPrice': instance.totalPrice,
  'paymentType': instance.paymentType,
  'isPaid': instance.isPaid,
  'isDelivered': instance.isDelivered,
  'state': instance.state,
  '_id': instance.id,
  'orderNumber': instance.orderNumber,
  '__v': instance.v,
};

OrderItemsBean _$OrderItemsBeanFromJson(Map<String, dynamic> json) =>
    OrderItemsBean(
      product:
          json['product'] == null
              ? null
              : ProductBean.fromJson(json['product'] as Map<String, dynamic>),
      price: json['price'] as num?,
      quantity: json['quantity'] as num?,
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$OrderItemsBeanToJson(OrderItemsBean instance) =>
    <String, dynamic>{
      'product': instance.product,
      'price': instance.price,
      'quantity': instance.quantity,
      '_id': instance.id,
    };

ProductBean _$ProductBeanFromJson(Map<String, dynamic> json) => ProductBean(
  id2: json['_id'] as String?,
  title: json['title'] as String?,
  slug: json['slug'] as String?,
  description: json['description'] as String?,
  imgCover: json['imgCover'] as String?,
  images: (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
  price: json['price'] as num?,
  priceAfterDiscount: json['priceAfterDiscount'] as num?,
  quantity: json['quantity'] as num?,
  category: json['category'] as String?,
  occasion: json['occasion'] as String?,
  v: json['__v'] as num?,
  discount: json['discount'] as num?,
  sold: json['sold'] as num?,
  rateAvg: json['rateAvg'] as num?,
  rateCount: json['rateCount'] as num?,
  id: json['id'] as String?,
);

Map<String, dynamic> _$ProductBeanToJson(ProductBean instance) =>
    <String, dynamic>{
      '_id': instance.id2,
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
      '__v': instance.v,
      'discount': instance.discount,
      'sold': instance.sold,
      'rateAvg': instance.rateAvg,
      'rateCount': instance.rateCount,
      'id': instance.id,
    };
