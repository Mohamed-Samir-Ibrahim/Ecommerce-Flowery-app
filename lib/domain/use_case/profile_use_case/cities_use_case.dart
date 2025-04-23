import 'package:flowery/data/model/profile_model/addAddressRequest.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/entity/profile_entity/addaddress.dart';
import 'package:flowery/domain/entity/profile_entity/citiesentity.dart';
import 'package:flowery/domain/entity/profile_entity/statesentity.dart';
import 'package:flowery/domain/repository_contract/profile_repository_contract/profile_repository_contract.dart';
import 'package:injectable/injectable.dart';
@injectable
class cities_use_case {
  ProfileRepositoryContract profileRepositoryContract;

  cities_use_case(this.profileRepositoryContract);
  Future<ApiResult<List<Citiesentity>>>get(){
    return  profileRepositoryContract.getCities();


  }
  Future<ApiResult<List<statesentity>>>getstates(){
    return  profileRepositoryContract.getstates();


  }
  Future<ApiResult<Addaddress>>SaveAddress(AddAddressRequest request){
    return  profileRepositoryContract.saveaddress(request);

  }

}