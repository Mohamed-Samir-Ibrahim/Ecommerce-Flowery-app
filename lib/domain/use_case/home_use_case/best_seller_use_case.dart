import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/entity/home_entity/best_seller_entity/best_seller_entity.dart';
import 'package:flowery/domain/repository_contract/home_repository_contract/best_seller_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class BestSellerUseCase{
  BestSellerRepository bestSellerRepository;
  BestSellerUseCase({required this.bestSellerRepository});
  Future<ApiResult<BestSellerEntity>>get(){
   return bestSellerRepository.GetData();

  }


}