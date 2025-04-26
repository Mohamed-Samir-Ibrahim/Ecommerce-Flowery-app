import 'package:equatable/equatable.dart';

class TermsEntity extends Equatable {
  final String? section;
  final Map<String, String>? title;
  final Map<String, dynamic> content;
  final Map<String, dynamic> style;

  const TermsEntity({
    required this.section,
    required this.title,
    required this.content,
    required this.style,
  });

  TermsEntity copyWith({
    String? section,
    Map<String, String>? title,
    Map<String, dynamic>? content,
    Map<String, dynamic>? style,
  }) {
    return TermsEntity(
      section: section ?? this.section,
      title: title ?? this.title,
      content: content ?? this.content,
      style: style ?? this.style,
    );
  }

  @override
  List<Object?> get props => [section, title, content, style];
}