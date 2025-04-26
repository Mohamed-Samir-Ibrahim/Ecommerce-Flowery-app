import 'package:flowery/domain/entity/Profile_entity/about_entity.dart';
import 'package:flowery/domain/repository_contract/Profile_repository_contract/about_repository_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class AboutUseCase {
  final AboutRepository repository;

  AboutUseCase(this.repository);

  Future<List<AboutEntity>> call() async {
    return await repository.getAbout();
  }
}