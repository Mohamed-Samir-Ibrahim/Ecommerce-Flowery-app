import 'package:flowery/domain/entity/Profile_entity/terms_entity.dart';
import 'package:flowery/domain/repository_contract/home_repository_contract/terms_repository_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class TermsUseCase {
  final TermsRepositoryContract repository;

  TermsUseCase(this.repository);

  Future<List<TermsEntity>> call() async {
    return await repository.getTerms();
  }
}