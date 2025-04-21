import 'package:flowery/domain/entity/Profile_entity/about_entity.dart';

abstract class AboutRepository {
  Future<List<AboutEntity>> getAbout();
}