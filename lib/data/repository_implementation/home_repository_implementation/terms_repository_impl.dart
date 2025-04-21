import 'package:flowery/data/data_source/local_data_source/terms/terms_local_data_source.dart';
import 'package:flowery/domain/entity/Profile_entity/terms_entity.dart';
import 'package:flowery/domain/repository_contract/home_repository_contract/terms_repository_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: TermsRepositoryContract)
class TermsRepositoryImpl implements TermsRepositoryContract {
  final TermsLocalDataSource localDataSource;

  TermsRepositoryImpl(this.localDataSource);

  @override
  Future<List<TermsEntity>> getTerms() async {
    return await localDataSource.loadTermsFromJson();
  }
}