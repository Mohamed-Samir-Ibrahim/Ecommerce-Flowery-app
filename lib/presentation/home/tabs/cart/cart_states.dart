import 'package:equatable/equatable.dart';
import 'package:flowery/data/model/payment_model/checkout_session_model/checkout_session_response.dart';
import 'package:flowery/data/model/payment_model/create_cash_order_model/creat_cash_order_response.dart';
import 'package:flowery/data/model/user_address_model/get_logged_user_address.dart';
import 'package:flowery/domain/entity/cart_entity/delete_item.dart';

import '../../../../domain/entity/cart_entity/GetCartEntity.dart';
import '../../../../domain/entity/cart_entity/cart_entity.dart';


enum Status { loading, success, error, }

class CartStates extends Equatable {
  Status status;
  CartEntity? cartResponseDto;
  DeleteItem? deleteItem;
  GetCartEntity? getCartEntity;
  CreatCashOrderResponse ?cashOrderResponse;
  CheckoutSessionResponse? checkoutSessionResponse;
  GetLoggedUserAddressResponse? getLoggedUserAddressResponse;
  Exception? exception;
  String? loadingMessage;
  bool ?paymentMethod;
  CartStates({required this.status,
    this.deleteItem,
    this.exception,
    this.loadingMessage,
    this.getLoggedUserAddressResponse,
    this.paymentMethod,
    this.cashOrderResponse, this.checkoutSessionResponse
    , this.cartResponseDto, this.getCartEntity
  });

  CartStates copyWith({
    Status? status,
    Exception? exception,
    CheckoutSessionResponse? checkoutSessionResponse,
    CreatCashOrderResponse ?cashOrderResponse,
    GetLoggedUserAddressResponse? getLoggedUserAddressResponse,
    bool ?paymentMethod,
    GetCartEntity? getCartEntity,
    CartEntity? cartResponseDto,
    DeleteItem? delete,
    String? loadingMessage,
  }) {
    return CartStates(
        deleteItem: deleteItem ?? this.deleteItem,
        status: status ?? this.status,
        loadingMessage: loadingMessage ?? this.loadingMessage,
        exception: exception ?? this.exception,
        paymentMethod: paymentMethod??this.paymentMethod,
        getLoggedUserAddressResponse: getLoggedUserAddressResponse??this.getLoggedUserAddressResponse,
        cashOrderResponse: cashOrderResponse ?? this.cashOrderResponse,
        checkoutSessionResponse: checkoutSessionResponse ??
            this.checkoutSessionResponse
        ,
        cartResponseDto: cartResponseDto ?? this.cartResponseDto,
        getCartEntity: getCartEntity ?? this.getCartEntity
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      [
        paymentMethod,
        status,
        exception,
        getLoggedUserAddressResponse,
        loadingMessage,
        checkoutSessionResponse,
        cashOrderResponse,deleteItem
        ,
        cartResponseDto,
        getCartEntity
      ];

}

