import 'package:flowery/domain/entity/Profile_entity/about_entity.dart';

class AboutModel extends AboutEntity {
  AboutModel({
    required super.section,
    required super.title,
    required super.content,
    required super.style,
  });

  factory AboutModel.fromJson(Map<String, dynamic> json) {
    return AboutModel(
      section: json['section'],
      title: Map<String, String>.from(json['title'] ?? {}),
      content: json['content'],
      style: Map<String, dynamic>.from(json['style'] ?? {}),
    );
  }
}