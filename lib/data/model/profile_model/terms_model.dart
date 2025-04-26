import 'package:flowery/domain/entity/Profile_entity/terms_entity.dart';

class TermsModel extends TermsEntity {
  const TermsModel({
    required super.section,
    required super.title,
    required super.content,
    required super.style,
  });

  factory TermsModel.fromJson(Map<String, dynamic> json) {
    return TermsModel(
      section: json['section'],
      title: json['title'] != null ? Map<String, String>.from(json['title']) : null,
      content: Map<String, dynamic>.from(json['content']),
      style: Map<String, dynamic>.from(json['style'] ?? {}),
    );
  }
}