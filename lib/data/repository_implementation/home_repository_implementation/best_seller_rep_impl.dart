import 'package:flowery/data/data_source/remote_data_source/home_remote_data_source/best_seller_contract.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/entity/auth_entity/signupentity.dart';
import 'package:flowery/domain/entity/home_entity/best_seller_entity/best_seller_entity.dart';
import 'package:flowery/domain/repository_contract/home_repository_contract/best_seller_repository.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: BestSellerRepository)
class bestSellerRepositoryImpl implements BestSellerRepository{
  BestSellerContract bestSellerContractt;
  bestSellerRepositoryImpl({required this.bestSellerContractt});
  @override
  Future<ApiResult<BestSellerEntity>> GetData()async {
  return await bestSellerContractt.getdata();
  }



}