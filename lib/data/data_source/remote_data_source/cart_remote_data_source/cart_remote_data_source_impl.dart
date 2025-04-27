import 'package:flowery/core/shared_Preferences.dart';
import 'package:flowery/data/api_excuter.dart';
import 'package:flowery/data/model/cart_model/cart_request.dart';
import 'package:flowery/data/model/cart_model/cart_response_dto.dart';
import 'package:flowery/data/web_services/WebServices.dart';
import 'package:flowery/domain/entity/cart_entity/GetCartEntity.dart';
import 'package:flowery/domain/entity/cart_entity/cart_entity.dart';
import 'package:flowery/domain/entity/cart_entity/delete_item.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/common/api_result.dart';
import 'cart_remote_data_source_contract.dart';
@Injectable(as: cart_remote_data_source_contract)
class cart_remote_data_source_impl  extends cart_remote_data_source_contract {

  WebServices webServices;

  cart_remote_data_source_impl(this.webServices);

  @override
  Future<ApiResult<CartEntity>> getCartItems(

      {required CartRequest cartreq}) async {
    return executeApi<CartEntity>(() async {

        var token = await SecureStorageService().getToken();

      var result = await webServices.cart(cartreq, 'Bearer $token');
      return result;
    });
  }

  @override
  Future<ApiResult<CartEntity>> getcart() async {
    return executeApi<CartEntity>(() async {
      var token = await SecureStorageService().getToken();

      var result = await webServices.getCart('Bearer $token');

      return result;
    });
  }




  @override
  Future<ApiResult<DeleteItem>> Delete(String ProductId) async{
    return executeApi<DeleteItem>(()async{
      var token = await SecureStorageService().getToken();


      var result = await webServices.deleteCartItem(ProductId,('Bearer $token'));
      return result;


    });
    }
  }
