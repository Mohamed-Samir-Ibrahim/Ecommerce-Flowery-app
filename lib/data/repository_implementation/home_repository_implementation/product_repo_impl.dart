import 'package:flowery/data/data_source/remote_data_source/home_remote_data_source/product_data_source_contract.dart';
import 'package:flowery/data/model/home_model/product_model/product_response_dto.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/repository_contract/home_repository_contract/product_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:ProductRepo)
class ProductRepoImpl implements ProductRepo {
  final ProductDataSourceContract _onlineDataSource;

  @factoryMethod
  ProductRepoImpl(this._onlineDataSource);

  @override
  Future<ApiResult<ProductResponseDto>> getAllProducts() async {
    return await _onlineDataSource.getAllProducts();
  }
}