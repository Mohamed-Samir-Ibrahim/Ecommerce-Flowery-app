import 'package:flowery/data/model/home_model/product_model/product_response_dto.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/entity/home_entity/product_response_entity/product_response_entity.dart';

abstract class ProductRepo {
  Future<ApiResult<ProductResponseDto>> getAllProducts();
}