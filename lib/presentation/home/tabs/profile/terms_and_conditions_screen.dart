import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flowery/data/model/Profile/terms_section.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key});

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  List<TermsSection> sections = [];

  @override
  void initState() {
    super.initState();
    loadTermsContent();
  }

  Future<void> loadTermsContent() async {
    final String jsonString = await rootBundle.loadString(
        'assets/Flowery Terms and Conditions JSON with Arabic and English.json');
    final Map<String, dynamic> jsonData = json.decode(jsonString);
    final List<dynamic> items = jsonData['terms_and_conditions'];

    setState(() {
      sections = items.map((e) => TermsSection.fromJson(e)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final lang = context.locale.languageCode;
    final bool isArabic = lang == 'ar';

    return Scaffold(
      appBar: AppBar(title: Text('terms_and_conditions'.tr())),
      body: sections.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: sections.length,
              itemBuilder: (context, index) {
                final section = sections[index];
                final isList = section.content[lang] is List;
                final contentItems = section.content[lang];
                final style = section.style;
                final titleStyle = style['title'] ?? {};
                final contentStyle = style['content'] ?? {};

                final isFirstSection = index == 0;
                final isSecondSection = index == 1;

                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.all(10),
                  color: HexColor(
                    (titleStyle['backgroundColor'] ??
                            style['backgroundColor'] ??
                            '#FFFFFF')
                        .toString(),
                  ),
                  child: Column(
                    crossAxisAlignment: isFirstSection || isSecondSection
                        ? CrossAxisAlignment.center
                        : (isArabic
                            ? CrossAxisAlignment.end
                            : CrossAxisAlignment.start),
                    children: [
                      if (section.title != null)
                        Row(
                          children: [
                            Text(
                              section.title?[lang] ?? '',
                              style: TextStyle(
                                fontSize:
                                    (titleStyle['fontSize'] ?? 18).toDouble(),
                                fontWeight: titleStyle['fontWeight'] == 'bold'
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                color: HexColor(titleStyle['color'] ?? '#000000'),
                              ),
                              textAlign: isFirstSection || isSecondSection
                                  ? TextAlign.center
                                  : (isArabic
                                      ? TextAlign.right
                                      : TextAlign.left),
                            ),
                          ],
                        ),
                      const SizedBox(height: 10),
                      if (isList && contentItems != null)
                        ...List.generate(contentItems.length, (i) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Text(
                              contentItems[i],
                              style: TextStyle(
                                fontSize: (contentStyle['fontSize'] ?? 16)
                                    .toDouble(),
                                fontWeight:
                                    contentStyle['fontWeight'] == 'bold'
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                color: HexColor(
                                    contentStyle['color'] ?? '#333333'),
                              ),
                              textAlign: isFirstSection || isSecondSection
                                  ? TextAlign.center
                                  : (isArabic
                                      ? TextAlign.right
                                      : TextAlign.left),
                            ),
                          );
                        })
                      else if (contentItems is String)
                        Text(
                          contentItems,
                          style: TextStyle(
                            fontSize:
                                (contentStyle['fontSize'] ?? 16).toDouble(),
                            fontWeight: contentStyle['fontWeight'] == 'bold'
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color: HexColor(contentStyle['color'] ?? '#333333'),
                          ),
                          textAlign: isFirstSection || isSecondSection
                              ? TextAlign.center
                              : (isArabic
                                  ? TextAlign.right
                                  : TextAlign.left),
                        ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}

class HexColor extends Color {
  HexColor(final String hex)
      : super(int.parse(hex.replaceFirst('#', '0xff')));
}
