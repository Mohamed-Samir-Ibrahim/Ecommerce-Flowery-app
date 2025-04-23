class GetCartEntity {
  GetCartEntity({
      this.message,
      this.numOfCartItems,
      this.cart,});

  GetCartEntity.fromJson(dynamic json) {
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    cart = json['cart'] != null ? Cart.fromJson(json['cart']) : null;
  }
  String? message;
  num? numOfCartItems;
  Cart? cart;
GetCartEntity copyWith({  String? message,
  num? numOfCartItems,
  Cart? cart,
}) => GetCartEntity(  message: message ?? this.message,
  numOfCartItems: numOfCartItems ?? this.numOfCartItems,
  cart: cart ?? this.cart,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['numOfCartItems'] = numOfCartItems;
    if (cart != null) {
      map['cart'] = cart?.toJson();
    }
    return map;
  }

}

class Cart {
  Cart({
      this.cartItems,
      this.discount,
      this.totalPrice,
      this.totalPriceAfterDiscount,});

  Cart.fromJson(dynamic json) {
    if (json['cartItems'] != null) {
      cartItems = [];
      json['cartItems'].forEach((v) {
        cartItems?.add;
      });
    }
    discount = json['discount'];
    totalPrice = json['totalPrice'];
    totalPriceAfterDiscount = json['totalPriceAfterDiscount'];
  }
  List<dynamic>? cartItems;
  num? discount;
  num? totalPrice;
  num? totalPriceAfterDiscount;
Cart copyWith({  List<dynamic>? cartItems,
  num? discount,
  num? totalPrice,
  num? totalPriceAfterDiscount,
}) => Cart(  cartItems: cartItems ?? this.cartItems,
  discount: discount ?? this.discount,
  totalPrice: totalPrice ?? this.totalPrice,
  totalPriceAfterDiscount: totalPriceAfterDiscount ?? this.totalPriceAfterDiscount,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (cartItems != null) {
      map['cartItems'] = cartItems?.map((v) => v.toJson()).toList();
    }
    map['discount'] = discount;
    map['totalPrice'] = totalPrice;
    map['totalPriceAfterDiscount'] = totalPriceAfterDiscount;
    return map;
  }

}