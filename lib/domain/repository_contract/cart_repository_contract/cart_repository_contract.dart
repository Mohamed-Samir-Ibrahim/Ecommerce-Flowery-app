import 'package:flowery/data/model/cart_model/cart_request.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/entity/cart_entity/GetCartEntity.dart';
import 'package:flowery/domain/entity/cart_entity/cart_entity.dart';
import 'package:flowery/domain/entity/cart_entity/delete_item.dart';

abstract class cart_repoistory_contract {

Future<ApiResult<CartEntity>>get({required CartRequest cartreq});
Future<ApiResult<CartEntity>>getcart();
Future<ApiResult<DeleteItem>>Delete(String ProductId);

}