class TermsSection {
  final String section;
  final Map<String, String>? title;
  final Map<String, dynamic> content;
  final Map<String, dynamic> style;

  TermsSection({
    required this.section,
    this.title,
    required this.content,
    required this.style,
  });

  factory TermsSection.fromJson(Map<String, dynamic> json) {
    return TermsSection(
      section: json['section'],
      title: json['title'] != null ? Map<String, String>.from(json['title']) : null,
      content: Map<String, dynamic>.from(json['content']),
      style: Map<String, dynamic>.from(json['style'] ?? {}),
    );
  }
}