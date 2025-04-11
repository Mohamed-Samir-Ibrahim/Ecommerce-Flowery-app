import 'package:flowery/data/api_excuter.dart';
import 'package:flowery/data/data_source/remote_data_source/home_remote_data_source/product_data_source_contract.dart';
import 'package:flowery/data/model/home_model/product_model/product_response_dto.dart';
import 'package:flowery/data/web_services/WebServices.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductDataSourceContract)
class ProductDataSourceImpl implements ProductDataSourceContract {
  WebServices client;
  ProductDataSourceImpl({required this.client});

  @override
  Future<ApiResult<ProductResponseDto>> getAllProducts()async {
return executeApi<ProductResponseDto>(()async{
return  await client.getProduct();

});
  }
}