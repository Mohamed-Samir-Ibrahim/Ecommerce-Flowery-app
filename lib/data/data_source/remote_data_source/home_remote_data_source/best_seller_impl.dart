import 'package:flowery/data/api_excuter.dart';
import 'package:flowery/data/data_source/remote_data_source/home_remote_data_source/best_seller_contract.dart';
import 'package:flowery/data/model/home_model/best_seller_response_dto.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/entity/home_entity/best_seller_entity/best_seller_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../web_services/WebServices.dart';
@Injectable(as: BestSellerContract)
class bestSellerImpl implements BestSellerContract{
  WebServices client;
  bestSellerImpl({required this.client});

  @override
  Future<ApiResult<BestSellerResponseDto>> getdata()async {
return executeApi<BestSellerResponseDto>(()async{
return  await client.get();

});
  }


}