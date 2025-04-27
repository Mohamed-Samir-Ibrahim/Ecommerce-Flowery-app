import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/entity/cart_entity/cart_entity.dart';
import 'package:flowery/domain/entity/cart_entity/delete_item.dart';
import 'package:flowery/domain/repository_contract/cart_repository_contract/cart_repository_contract.dart';
import 'package:injectable/injectable.dart';
@injectable
class DeleteItemUseCase {

  cart_repoistory_contract cart;
  DeleteItemUseCase(this.cart);

  Future<ApiResult<DeleteItem>> call(String ProductId)async{
    return await cart.Delete(ProductId);
}}