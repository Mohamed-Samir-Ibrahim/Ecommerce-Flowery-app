import 'package:json_annotation/json_annotation.dart';

part 'creat_cash_order_response.g.dart';

@JsonSerializable()
class CreatCashOrderResponse {
  String? message;
  OrderBean? order;

  CreatCashOrderResponse({this.message, this.order});

  factory CreatCashOrderResponse.fromJson(Map<String, dynamic> json) => _$CreatCashOrderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreatCashOrderResponseToJson(this);
}

@JsonSerializable()
class OrderBean {
  String ?user;
  List<OrderItemsBean>? orderItems;
  num ?totalPrice;
  String? paymentType;
  bool ?isPaid;
  bool ?isDelivered;
  String? state;
  String? id;
  String? orderNumber;
  num ?v;

  OrderBean({this.user, this.orderItems, this.totalPrice, this.paymentType, this.isPaid, this.isDelivered, this.state, this.id, this.orderNumber, this.v});

  factory OrderBean.fromJson(Map<String, dynamic> json) => _$OrderBeanFromJson(json);

  Map<String, dynamic> toJson() => _$OrderBeanToJson(this);
}

@JsonSerializable()
class OrderItemsBean {
  ProductBean ?product;
  num ?price;
  num ?quantity;
  String? id;

  OrderItemsBean({this.product, this.price, this.quantity, this.id});

  factory OrderItemsBean.fromJson(Map<String, dynamic> json) => _$OrderItemsBeanFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemsBeanToJson(this);
}

@JsonSerializable()
class ProductBean {
  String ?id2;
  String ?title;
  String ?slug;
  String ?description;
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
  String ?id;

  ProductBean({this.id2, this.title, this.slug, this.description, this.imgCover, this.images, this.price, this.priceAfterDiscount, this.quantity, this.category, this.occasion,  this.v, this.discount, this.sold, this.rateAvg, this.rateCount, this.id});

  factory ProductBean.fromJson(Map<String, dynamic> json) => _$ProductBeanFromJson(json);

  Map<String, dynamic> toJson() => _$ProductBeanToJson(this);
}

