import 'package:flowery/data/data_source/remote_data_source/profile_remote_data_source/profile_data_source_contract.dart';
import 'package:flowery/data/model/profile_model/addAddressRequest.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/entity/profile_entity/addaddress.dart';
import 'package:flowery/domain/entity/profile_entity/citiesentity.dart';
import 'package:flowery/domain/entity/profile_entity/statesentity.dart';
import 'package:flowery/domain/repository_contract/profile_repository_contract/profile_repository_contract.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: ProfileRepositoryContract)
class ProfileRepositoryImpl implements ProfileRepositoryContract {
  profileDataSourceContract prof;

  ProfileRepositoryImpl(this.prof);

  @override
  Future<ApiResult<List<Citiesentity>>> getCities() async{
    return await prof.get();
  }

  @override
  Future<ApiResult<List<statesentity>>> getstates()async {
return await prof.getstates();
  }

  @override
  Future<ApiResult<Addaddress>> saveaddress(AddAddressRequest request) {
    return prof.saveAddress(request);
  }



}