import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/entity/cart_entity/GetCartEntity.dart';
import 'package:flowery/domain/entity/cart_entity/cart_entity.dart';
import 'package:flowery/domain/repository_contract/cart_repository_contract/cart_repository_contract.dart';
import 'package:injectable/injectable.dart';
@injectable
 class getCartUseCase {
cart_repoistory_contract cart;

getCartUseCase(this.cart);

Future<ApiResult<CartEntity>>get()async{
  return await cart.getcart();

}

}