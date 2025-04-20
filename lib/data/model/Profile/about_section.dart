class AboutSection {
  final String section;
  final Map<String, dynamic> content;
  final Map<String, dynamic>? title;
  final Map<String, dynamic> style;

  AboutSection({
    required this.section,
    required this.content,
    required this.style,
    this.title,
  });

  factory AboutSection.fromJson(Map<String, dynamic> json) {
    return AboutSection(
      section: json['section'] ?? '',
      content: Map<String, dynamic>.from(json['content'] ?? {}),
      title: json['title'] != null ? Map<String, dynamic>.from(json['title']) : null,
      style: Map<String, dynamic>.from(json['style'] ?? {}),
    );
  }
}