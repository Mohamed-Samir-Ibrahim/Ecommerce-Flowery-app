import 'package:flowery/data/api_excuter.dart';
import 'package:flowery/data/data_source/remote_data_source/Category_remote_data_source/Category_remote_data_source_contract.dart';
import 'package:flowery/data/web_services/WebServices.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/entity/Categotries_entity/category_model.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: Category_Remote_Data_Source_Contract)
class CategoryRemoteDataSourceImplementation implements Category_Remote_Data_Source_Contract {
  WebServices client;

  CategoryRemoteDataSourceImplementation({required this.client});

  @override
  Future<ApiResult<List<Categories_entity>>> getCategories() async {
    return executeApi<List<Categories_entity>>(() async {
      var response = await client.getCategories();
      return response.categories ?? []; 
    });
  }
}