import 'package:flowery/data/model/Profile/about_model.dart';

abstract class AboutLocalDataSource {
  Future<List<AboutModel>> loadAboutFromJson();
}