import 'package:flowery/domain/entity/Profile_entity/terms_entity.dart';

abstract class TermsRepositoryContract {
  Future<List<TermsEntity>> getTerms();
}