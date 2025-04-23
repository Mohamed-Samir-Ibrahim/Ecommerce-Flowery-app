import 'package:flowery/data/model/cart_model/cart_request.dart';
import 'package:flowery/domain/entity/cart_entity/cart_entity.dart';
import 'package:flowery/domain/entity/cart_entity/delete_item.dart';

import '../../../../domain/common/api_result.dart';
import '../../../../domain/entity/cart_entity/GetCartEntity.dart';

abstract class cart_remote_data_source_contract {
  Future<ApiResult<CartEntity>> getCartItems({required CartRequest cartreq});
  Future<ApiResult<CartEntity>> getcart();
  Future<ApiResult<DeleteItem>>Delete();
}