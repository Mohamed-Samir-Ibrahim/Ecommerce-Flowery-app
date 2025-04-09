import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/entity/home_entity/best_seller_entity/best_seller_entity.dart';

abstract class BestSellerContract{
  Future<ApiResult<BestSellerEntity>>getdata();


}