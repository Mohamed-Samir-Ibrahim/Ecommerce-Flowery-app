import 'package:flowery/data/data_source/local_data_source/about/about_local_data_source.dart';
import 'package:flowery/domain/entity/Profile_entity/about_entity.dart';
import 'package:flowery/domain/repository_contract/home_repository_contract/about_repository_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AboutRepository)
class AboutRepositoryImpl implements AboutRepository {
  final AboutLocalDataSource dataSource;
  AboutRepositoryImpl(this.dataSource);

  @override
  Future<List<AboutEntity>> getAbout() => dataSource.loadAboutFromJson();
}