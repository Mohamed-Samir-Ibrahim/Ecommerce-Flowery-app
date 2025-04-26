import 'package:flowery/data/model/profile_model/terms_model.dart';

abstract class TermsLocalDataSource {
  Future<List<TermsModel>> loadTermsFromJson();
}