import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/entity/Categotries_entity/category_model.dart';

abstract class CategoryRepositoryContract {
  Future<ApiResult<List<Categories_entity>>> getCategories();
}