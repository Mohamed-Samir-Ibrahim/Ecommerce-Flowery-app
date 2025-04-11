import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/entity/Categotries_entity/category_model.dart';

abstract class Category_Remote_Data_Source_Contract {
  Future<ApiResult<List<Categories_entity>>> getCategories();
}