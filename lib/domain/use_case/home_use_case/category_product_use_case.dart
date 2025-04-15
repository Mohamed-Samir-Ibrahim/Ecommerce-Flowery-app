import 'package:flowery/data/model/home_model/home_model.dart';
import 'package:flowery/data/model/home_model/occasions/occasions_model.dart';
import 'package:flowery/data/model/home_model/product/product_model.dart';
import 'package:flowery/data/model/home_model/product_by_occasion.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/repository_contract/home_repository_contract/home_repository_contract.dart';
import 'package:injectable/injectable.dart';

@injectable

class CategoryProductUseCase {
  HomeRepositoryContract categoryProducts;
  CategoryProductUseCase(this.categoryProducts);
  Future<ApiResult<ProductByOccasion>>invoke(String categoryId){
    var homeList= categoryProducts.getCategoryProducts(categoryId);
    return homeList;
  }
}