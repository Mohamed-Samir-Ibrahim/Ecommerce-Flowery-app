import 'package:flowery/data/model/profile_model/about_model.dart';

abstract class AboutLocalDataSource {
  Future<List<AboutModel>> loadAboutFromJson();
}