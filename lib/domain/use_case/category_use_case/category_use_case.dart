// ignore_for_file: non_constant_identifier_names

import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/entity/Categotries_entity/category_model.dart';
import 'package:flowery/domain/repository_contract/category_repository_contract/category_repository_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class CategoryUseCase {
  final CategoryRepositoryContract obj_category_Repository_Contract;

  CategoryUseCase({required this.obj_category_Repository_Contract});

  Future<ApiResult<List<Categories_entity>>> invoke() async {
    var response = await obj_category_Repository_Contract.getCategories();
    print("✅ CategoryUseCase Response: $response");
    return response;
  }
}