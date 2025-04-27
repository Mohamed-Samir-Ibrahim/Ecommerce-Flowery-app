import 'package:flowery/data/data_source/remote_data_source/cart_remote_data_source/cart_remote_data_source_contract.dart';
import 'package:flowery/data/model/cart_model/cart_request.dart';

import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/entity/cart_entity/GetCartEntity.dart';

import 'package:flowery/domain/entity/cart_entity/cart_entity.dart';
import 'package:flowery/domain/entity/cart_entity/delete_item.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/repository_contract/cart_repository_contract/cart_repository_contract.dart';
@Injectable(as: cart_repoistory_contract)
class cart_repository_impl implements cart_repoistory_contract{
  final cart_remote_data_source_contract cart;
  cart_repository_impl({required this.cart});

  @override
  Future<ApiResult<CartEntity>> get({required CartRequest cartreq}) async{
return  await  cart.getCartItems(cartreq: cartreq);
  }

  @override
  Future<ApiResult<CartEntity>> getcart() async{
  return await cart.getcart();
  }

  @override
  Future<ApiResult<DeleteItem>> Delete(String ProductId)async {
  return await cart.Delete(ProductId);
  }



}