import 'package:flowery/data/model/home_model/categories/categories_model.dart';
import 'package:flowery/data/model/home_model/home_model.dart';
import 'package:flowery/data/model/home_model/occasions/occasions_model.dart';
import 'package:flowery/data/model/home_model/product/product_model.dart';
import 'package:flowery/data/model/home_model/product_by_occasion.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/entity/home_entity/category.dart';

abstract class HomeRepositoryContract {
  Future<ApiResult<HomeModel>>getHomeScreen();
  Future<ApiResult<ProductByOccasion>>getOccasionProducts(String occasionId);
  Future<ApiResult<ProductByOccasion>>getCategoryProducts(String categoryId);
  Future<ApiResult<ProductByOccasion>>getAllProducts();

}