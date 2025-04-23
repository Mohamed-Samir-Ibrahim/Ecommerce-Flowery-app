class CartEntity {
  CartEntity({
    this.message,
    this.numOfCartItems,
    this.cart,});

  CartEntity.fromJson(dynamic json) {
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    cart = json['cart'] != null ? Cart.fromJson(json['cart']) : null;
  }
  String? message;
  num? numOfCartItems;
  Cart? cart;
  CartEntity copyWith({  String? message,
    num? numOfCartItems,
    Cart? cart,
  }) => CartEntity(  message: message ?? this.message,
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
    this.id,
    this.user,
    this.cartItems,
    this.discount,
    this.totalPrice,
    this.totalPriceAfterDiscount,
    this.createdAt,
    this.updatedAt,
    this.v,});

  Cart.fromJson(dynamic json) {
    id = json['_id'];
    user = json['user'];
    if (json['cartItems'] != null) {
      cartItems = [];
      json['cartItems'].forEach((v) {
        cartItems?.add(CartItems.fromJson(v));
      });
    }
    discount = json['discount'];
    totalPrice = json['totalPrice'];
    totalPriceAfterDiscount = json['totalPriceAfterDiscount'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
  String? id;
  String? user;
  List<CartItems>? cartItems;
  num? discount;
  num? totalPrice;
  num? totalPriceAfterDiscount;
  String? createdAt;
  String? updatedAt;
  num? v;
  Cart copyWith({  String? id,
    String? user,
    List<CartItems>? cartItems,
    num? discount,
    num? totalPrice,
    num? totalPriceAfterDiscount,
    String? createdAt,
    String? updatedAt,
    num? v,
  }) => Cart(  id: id ?? this.id,
    user: user ?? this.user,
    cartItems: cartItems ?? this.cartItems,
    discount: discount ?? this.discount,
    totalPrice: totalPrice ?? this.totalPrice,
    totalPriceAfterDiscount: totalPriceAfterDiscount ?? this.totalPriceAfterDiscount,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    v: v ?? this.v,
  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['user'] = user;
    if (cartItems != null) {
      map['cartItems'] = cartItems?.map((v) => v.toJson()).toList();
    }
    map['discount'] = discount;
    map['totalPrice'] = totalPrice;
    map['totalPriceAfterDiscount'] = totalPriceAfterDiscount;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }

}

class CartItems {
  CartItems({
    this.product,
    this.price,
    this.quantity,
    this.id,});

  CartItems.fromJson(dynamic json) {
    product = json['product'] != null ? Product.fromJson(json['product']) : null;
    price = json['price'];
    quantity = json['quantity'];
    id = json['_id'];
  }
  Product? product;
  num? price;
  num? quantity;
  String? id;
  CartItems copyWith({  Product? product,
    num? price,
    num? quantity,
    String? id,
  }) => CartItems(  product: product ?? this.product,
    price: price ?? this.price,
    quantity: quantity ?? this.quantity,
    id: id ?? this.id,
  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (product != null) {
      map['product'] = product?.toJson();
    }
    map['price'] = price;
    map['quantity'] = quantity;
    map['_id'] = id;
    return map;
  }

}

class Product {
  Product({
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

  Product.fromJson(dynamic json) {
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
  Product copyWith({  String? id,
    String? title,
    String? slug,
    String? description,
    String? imgCover,
    List<String>? images,
    num? price,
    num? priceAfterDiscount,
    num? quantity,
    String? category,
    String? occasion,
    String? createdAt,
    String? updatedAt,
    num? v,
    num? discount,
    num? sold,
    num? rateAvg,
    num? rateCount,
  }) => Product(  id: id ?? this.id,
    title: title ?? this.title,
    slug: slug ?? this.slug,
    description: description ?? this.description,
    imgCover: imgCover ?? this.imgCover,
    images: images ?? this.images,
    price: price ?? this.price,
    priceAfterDiscount: priceAfterDiscount ?? this.priceAfterDiscount,
    quantity: quantity ?? this.quantity,
    category: category ?? this.category,
    occasion: occasion ?? this.occasion,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    v: v ?? this.v,
    discount: discount ?? this.discount,
    sold: sold ?? this.sold,
    rateAvg: rateAvg ?? this.rateAvg,
    rateCount: rateCount ?? this.rateCount,
  );
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
    return map;
  }

}