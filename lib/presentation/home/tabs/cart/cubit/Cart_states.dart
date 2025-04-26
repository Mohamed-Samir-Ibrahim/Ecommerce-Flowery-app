// import 'package:equatable/equatable.dart';
// import 'package:flowery/domain/entity/cart_entity/GetCartEntity.dart';
// import 'package:flowery/domain/entity/cart_entity/cart_entity.dart';
// import 'package:flowery/domain/entity/cart_entity/delete_item.dart';
//
// enum states { initial, loading, success, error }
//
// class CartStates extends Equatable {
//   final states state;
//     CartEntity? cartResponseDto;
//     GetCartEntity? getCartEntity;
//     DeleteItem? deleteItem;
//     Exception? exception;
//     Product? product;
//   CartStates({  this.getCartEntity,required this.state,this.product,  this.cartResponseDto, this.exception ,this.deleteItem});
//
//   CartStates copyWith({states? state,DeleteItem? deleteItem,GetCartEntity ? getCartEntity, CartEntity? cartResponseDto, Exception? exception}) {
//     return CartStates(state: state ?? this.state, cartResponseDto: cartResponseDto ?? this.cartResponseDto,exception:exception, getCartEntity: getCartEntity??this.getCartEntity,deleteItem: deleteItem??this.deleteItem);
//   }
//
//
//   @override
//   // TODO: implement props
//   List<Object?> get props => [state, cartResponseDto,exception, getCartEntity,deleteItem];
//
//
//
// }