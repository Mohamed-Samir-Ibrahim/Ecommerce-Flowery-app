import 'package:flowery/data/model/home_model/categories/categories_model.dart';
import 'package:flowery/data/model/home_model/home_model.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/entity/home_entity/category.dart';

abstract class HomeRepositoryContract {
  Future<ApiResult<HomeModel>>getHomeScreen();

}