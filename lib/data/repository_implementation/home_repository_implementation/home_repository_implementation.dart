import 'package:flowery/data/data_source/remote_data_source/home_remote_data_source/home_remote_data_source_contract.dart';
import 'package:flowery/data/model/home_model/categories/categories_model.dart';
import 'package:flowery/data/model/home_model/home_model.dart';
import 'package:flowery/data/model/home_model/occasions/occasions_model.dart';
import 'package:flowery/data/model/home_model/product/product_model.dart';
import 'package:flowery/data/model/home_model/product_by_occasion.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/entity/home_entity/category.dart';
import 'package:flowery/domain/repository_contract/home_repository_contract/home_repository_contract.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: HomeRepositoryContract)

class HomeRepositoryImplementation extends HomeRepositoryContract{
  final HomeRemoteDataSourceContract _homeRemoteDataSourceContract;
HomeRepositoryImplementation(this._homeRemoteDataSourceContract);
  @override
  Future<ApiResult<HomeModel>> getHomeScreen()async {
    var home=_homeRemoteDataSourceContract.getHomeScreen();
return await home;
  }

  @override
  Future<ApiResult<ProductByOccasion>> getOccasionProducts(String occasionId)async {
    var occasion=_homeRemoteDataSourceContract.getOccasionProducts(occasionId);
    return await occasion;
  }

  @override
  Future<ApiResult<ProductByOccasion>> getCategoryProducts(String categoryId) async {
    var category=_homeRemoteDataSourceContract.getCategoryProducts(categoryId);
    return await category;
  }

  @override
  Future<ApiResult<ProductByOccasion>> getAllProducts()async {
    var products=_homeRemoteDataSourceContract.getAllProducts();
    return await products;
  }


}