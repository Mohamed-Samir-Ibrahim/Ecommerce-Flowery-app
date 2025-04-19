
import 'package:flowery/data/model/cart_model/cart_request.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/entity/cart_entity/cart_entity.dart';
import 'package:flowery/domain/repository_contract/cart_repository_contract/cart_repository_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class cart_usecase{
  cart_repoistory_contract cart;

  cart_usecase(this.cart);
  Future<ApiResult<CartEntity>>invoke({required CartRequest cartreq})async{

    return await cart.get(cartreq: cartreq);
  }




}