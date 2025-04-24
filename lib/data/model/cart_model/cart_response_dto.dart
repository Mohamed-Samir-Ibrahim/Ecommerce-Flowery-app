// import 'package:flowery/domain/entity/cart_entity/cart_entity.dart';
// import 'package:json_annotation/json_annotation.dart';
//
// part 'cart_response_dto.g.dart';
//
// @JsonSerializable()
// class Cartresponsedto  extends CartEntity{
//   Cartresponsedto({
//     required this.message,
//     required this.numOfCartItems,
//     required this.cartt,
//   });
//
//   final String? message;
//   static const String messageKey = "message";
//
//   final num? numOfCartItems;
//   static const String numOfCartItemsKey = "numOfCartItems";
//
//   final CartDto? cartt;
//   static const String cartKey = "cart";
//
//
//   Cartresponsedto copyWith({
//     String? message,
//     num? numOfCartItems,
//     CartDto? cart,
//   }) {
//     return Cartresponsedto(
//       message: message ?? this.message,
//       numOfCartItems: numOfCartItems ?? this.numOfCartItems,
//       cartt: cartt ?? this.cartt,
//     );
//   }
//
//   factory Cartresponsedto.fromJson(Map<String, dynamic> json) => _$CartresponsedtoFromJson(json);
//
//   Map<String, dynamic> toJson() => _$CartresponsedtoToJson(this);
//
//   @override
//   String toString(){
//     return "$message, $numOfCartItems, $cart, ";
//   }
// }
//
// @JsonSerializable()
// class CartDto  extends Cart{
//   CartDto({
//     required this.id,
//     required this.user,
//     required this.cartItemss,
//     required this.discount,
//     required this.totalPrice,
//     required this.totalPriceAfterDiscount,
//
//     required this.v,
//   });
//
//   @JsonKey(name: '_id')
//   final String? id;
//   static const String idKey = "_id";
//
//   final String? user;
//   static const String userKey = "user";
//
//   final List<CartItem>? cartItemss;
//   static const String cartItemsKey = "cartItems";
//
//   final num? discount;
//   static const String discountKey = "discount";
//
//   final num? totalPrice;
//   static const String totalPriceKey = "totalPrice";
//
//   final num? totalPriceAfterDiscount;
//   static const String totalPriceAfterDiscountKey = "totalPriceAfterDiscount";
//
//
//   @JsonKey(name: '__v')
//   final num? v;
//   static const String vKey = "__v";
//
//
//   CartDto copyWith({
//     String? id,
//     String? user,
//     List<CartItem>? cartItems,
//     num? discount,
//     num? totalPrice,
//     num? totalPriceAfterDiscount,
//     DateTime? createdAt,
//     DateTime? updatedAt,
//     num? v,
//   }) {
//     return CartDto(
//       id: id ?? this.id,
//       user: user ?? this.user,
//       cartItemss: cartItems ?? this.cartItemss,
//       discount: discount ?? this.discount,
//       totalPrice: totalPrice ?? this.totalPrice,
//       totalPriceAfterDiscount: totalPriceAfterDiscount ?? this.totalPriceAfterDiscount,
//
//       v: v ?? this.v,
//     );
//   }
//
//   factory CartDto.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
//
//   Map<String, dynamic> toJson() => _$CartToJson(this);
//
//   @override
//   String toString(){
//     return "$id, $user, $cartItems, $discount, $totalPrice, $totalPriceAfterDiscount, $createdAt, $updatedAt, $v, ";
//   }
// }
//
// @JsonSerializable()
// class CartItem {
//   CartItem({
//     required this.product,
//     required this.price,
//     required this.quantity,
//     required this.id,
//   });
//
//   final Product? product;
//   static const String productKey = "product";
//
//   final num? price;
//   static const String priceKey = "price";
//
//   final num? quantity;
//   static const String quantityKey = "quantity";
//
//
//   @JsonKey(name: '_id')
//   final String? id;
//   static const String idKey = "_id";
//
//
//   CartItem copyWith({
//     Product? product,
//     num? price,
//     num? quantity,
//     String? id,
//   }) {
//     return CartItem(
//       product: product ?? this.product,
//       price: price ?? this.price,
//       quantity: quantity ?? this.quantity,
//       id: id ?? this.id,
//     );
//   }
//
//   factory CartItem.fromJson(Map<String, dynamic> json) => _$CartItemFromJson(json);
//
//   Map<String, dynamic> toJson() => _$CartItemToJson(this);
//
//   @override
//   String toString(){
//     return "$product, $price, $quantity, $id, ";
//   }
// }
//
// @JsonSerializable()
// class Product {
//   Product({
//     required this.id,
//     required this.title,
//     required this.slug,
//     required this.description,
//     required this.imgCover,
//     required this.images,
//     required this.price,
//     required this.priceAfterDiscount,
//     required this.quantity,
//     required this.category,
//     required this.occasion,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.v,
//     required this.discount,
//     required this.sold,
//     required this.rateAvg,
//     required this.rateCount,
//     required this.productId,
//   });
//
//   @JsonKey(name: '_id')
//   final String? id;
//   static const String idKey = "_id";
//
//   final String? title;
//   static const String titleKey = "title";
//
//   final String? slug;
//   static const String slugKey = "slug";
//
//   final String? description;
//   static const String descriptionKey = "description";
//
//   final String? imgCover;
//   static const String imgCoverKey = "imgCover";
//
//   final List<String>? images;
//   static const String imagesKey = "images";
//
//   final num? price;
//   static const String priceKey = "price";
//
//   final num? priceAfterDiscount;
//   static const String priceAfterDiscountKey = "priceAfterDiscount";
//
//   final num? quantity;
//   static const String quantityKey = "quantity";
//
//   final String? category;
//   static const String categoryKey = "category";
//
//   final String? occasion;
//   static const String occasionKey = "occasion";
//
//   final DateTime? createdAt;
//   static const String createdAtKey = "createdAt";
//
//   final DateTime? updatedAt;
//   static const String updatedAtKey = "updatedAt";
//
//
//   @JsonKey(name: '__v')
//   final num? v;
//   static const String vKey = "__v";
//
//   final num? discount;
//   static const String discountKey = "discount";
//
//   final num? sold;
//   static const String soldKey = "sold";
//
//   final num? rateAvg;
//   static const String rateAvgKey = "rateAvg";
//
//   final num? rateCount;
//   static const String rateCountKey = "rateCount";
//
//   final String? productId;
//   static const String productIdKey = "id";
//
//
//   Product copyWith({
//     String? id,
//     String? title,
//     String? slug,
//     String? description,
//     String? imgCover,
//     List<String>? images,
//     num? price,
//     num? priceAfterDiscount,
//     num? quantity,
//     String? category,
//     String? occasion,
//     DateTime? createdAt,
//     DateTime? updatedAt,
//     num? v,
//     num? discount,
//     num? sold,
//     num? rateAvg,
//     num? rateCount,
//     String? productId,
//   }) {
//     return Product(
//       id: id ?? this.id,
//       title: title ?? this.title,
//       slug: slug ?? this.slug,
//       description: description ?? this.description,
//       imgCover: imgCover ?? this.imgCover,
//       images: images ?? this.images,
//       price: price ?? this.price,
//       priceAfterDiscount: priceAfterDiscount ?? this.priceAfterDiscount,
//       quantity: quantity ?? this.quantity,
//       category: category ?? this.category,
//       occasion: occasion ?? this.occasion,
//       createdAt: createdAt ?? this.createdAt,
//       updatedAt: updatedAt ?? this.updatedAt,
//       v: v ?? this.v,
//       discount: discount ?? this.discount,
//       sold: sold ?? this.sold,
//       rateAvg: rateAvg ?? this.rateAvg,
//       rateCount: rateCount ?? this.rateCount,
//       productId: productId ?? this.productId,
//     );
//   }
//
//   factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
//
//   Map<String, dynamic> toJson() => _$ProductToJson(this);
//
//   @override
//   String toString(){
//     return "$id, $title, $slug, $description, $imgCover, $images, $price, $priceAfterDiscount, $quantity, $category, $occasion, $createdAt, $updatedAt, $v, $discount, $sold, $rateAvg, $rateCount, $productId, ";
//   }
// }
