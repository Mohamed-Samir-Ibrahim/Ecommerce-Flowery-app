import 'package:flowery/domain/entity/Profile_entity/about_entity.dart';

abstract class AboutState {}

class AboutInitial extends AboutState {}
class AboutLoading extends AboutState {}
class AboutLoaded extends AboutState {
  final List<AboutEntity> sections;
  AboutLoaded(this.sections);
}
class AboutError extends AboutState {
  final String message;
  AboutError(this.message);
}