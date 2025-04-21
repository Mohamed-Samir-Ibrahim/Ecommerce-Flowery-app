import 'package:flowery/data/model/Profile/terms_model.dart';

abstract class TermsLocalDataSource {
  Future<List<TermsModel>> loadTermsFromJson();
}