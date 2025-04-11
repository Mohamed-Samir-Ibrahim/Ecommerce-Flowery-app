import 'package:flowery/data/api_excuter.dart';
import 'package:flowery/data/data_source/remote_data_source/home_remote_data_source/home_remote_data_source_contract.dart';
import 'package:flowery/data/model/home_model/categories/categories_model.dart';
import 'package:flowery/data/model/home_model/home_model.dart';
import 'package:flowery/data/web_services/WebServices.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/entity/home_entity/category.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRemoteDataSourceContract)
class HomeRemoteDataSourceImplementation
    implements HomeRemoteDataSourceContract {
  WebServices client;

  HomeRemoteDataSourceImplementation(this.client);

  @override
  Future<ApiResult<HomeModel>> getHomeScreen()async {
    return executeApi<HomeModel>(() async {
      var response = await client.getHomeScreen();


      return response;
    });
  }
}
