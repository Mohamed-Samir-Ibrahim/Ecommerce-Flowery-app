import 'package:equatable/equatable.dart';

class AboutEntity extends Equatable {
  final String? section;
  final Map<String, String>? title;
  final Map<String, dynamic> content;
  final Map<String, dynamic> style;

  const AboutEntity({
    required this.section,
    required this.title,
    required this.content,
    required this.style,
  });

  AboutEntity copyWith({
    String? section,
    Map<String, String>? title,
    Map<String, dynamic>? content,
    Map<String, dynamic>? style,
  }) {
    return AboutEntity(
      section: section ?? this.section,
      title: title ?? this.title,
      content: content ?? this.content,
      style: style ?? this.style,
    );
  }

  @override
  List<Object?> get props => [section, title, content, style];
}