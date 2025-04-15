// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:flowery/data/data_source/remote_data_source/Category_remote_data_source/Category_remote_data_source_contract.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/entity/Categotries_entity/category_model.dart';
import 'package:flowery/domain/repository_contract/category_repository_contract/category_repository_contract.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: CategoryRepositoryContract)

class category_repository_implementation extends CategoryRepositoryContract{
  Category_Remote_Data_Source_Contract obj_Category_Remote_Data_Source_Contract;
  category_repository_implementation({required this.obj_Category_Remote_Data_Source_Contract});


  @override
  Future<ApiResult<List<Categories_entity>>> getCategories()async {
    return await obj_Category_Remote_Data_Source_Contract.getCategories();

  }
}

