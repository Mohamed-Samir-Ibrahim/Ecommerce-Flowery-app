import 'package:flowery/data/model/home_model/categories/categories_model.dart';
import 'package:flowery/data/model/home_model/home_model.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/entity/home_entity/category.dart';
import 'package:flowery/domain/repository_contract/home_repository_contract/home_repository_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeUseCase {
  HomeRepositoryContract homeRepo;
  HomeUseCase(this.homeRepo);
  Future<ApiResult<HomeModel?>>invoke(){
    var homeList= homeRepo.getHomeScreen();
    return homeList;
  }
}