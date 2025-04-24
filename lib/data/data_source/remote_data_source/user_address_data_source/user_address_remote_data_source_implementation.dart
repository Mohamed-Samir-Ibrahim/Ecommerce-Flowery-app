import 'package:flowery/data/api_excuter.dart';
import 'package:flowery/data/data_source/remote_data_source/user_address_data_source/user_address_remote_data_source_contract.dart';
import 'package:flowery/data/model/user_address_model/get_logged_user_address.dart';
import 'package:flowery/data/web_services/WebServices.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: UserAddressRemoteDataSourceContract)
class UserAddressRemoteDataSourceImplementation
    implements UserAddressRemoteDataSourceContract {
  WebServices client;

  UserAddressRemoteDataSourceImplementation(this.client);


  @override
  Future<ApiResult<GetLoggedUserAddressResponse>> getLoggedUserAddresses({required String token})async {
    return executeApi<GetLoggedUserAddressResponse>(() async {
      var response = await client.loggedUserAddresses(token);

      return response;
    });

  }



}


