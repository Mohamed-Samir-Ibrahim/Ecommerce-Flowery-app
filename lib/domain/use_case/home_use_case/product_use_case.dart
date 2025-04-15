import 'package:flowery/data/model/home_model/product_model/product_response_dto.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/entity/home_entity/product_response_entity/product_response_entity.dart';
import 'package:flowery/domain/repository_contract/home_repository_contract/product_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductUseCase {
  final ProductRepo _productsRepo;

  @factoryMethod
  ProductUseCase(this._productsRepo);

  Future<ApiResult<ProductResponseDto>> getAllProducts() =>
      _productsRepo.getAllProducts();
}