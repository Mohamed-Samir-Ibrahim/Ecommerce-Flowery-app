import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flowery/data/model/Profile/about_section.dart';

class Aboutus extends StatefulWidget {
  const Aboutus({super.key});

  @override
  State<Aboutus> createState() => _AboutusState();
}

class _AboutusState extends State<Aboutus> {
  List<AboutSection> sections = [];

  @override
  void initState() {
    super.initState();
    loadContent();
  }

  Future<void> loadContent() async {
    final String jsonString = await rootBundle
        .loadString('assets/Flowery About Section JSON with Expanded Content.json');
    final Map<String, dynamic> jsonData = json.decode(jsonString);
    final List<dynamic> aboutApp = jsonData['about_app'];

    setState(() {
      sections = aboutApp
          .map((sectionJson) => AboutSection.fromJson(sectionJson))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final lang = context.locale.languageCode;
    final bool isArabic = lang == 'ar';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('about'.tr())),
      body: sections.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: sections.length,
              itemBuilder: (context, index) {
                final section = sections[index];
                final isList = section.content[lang] is List;
                final contentItems = section.content[lang];

                final isFirstOrSecond = index == 0 || index == 1;

                final style = section.style;
                final titleStyle = style['title'] ?? style;
                final contentStyle = style['content'] ?? style;

                // Fallback alignment from style or language
                final titleAlign = titleStyle['textAlign']?[lang] ??
                    (isFirstOrSecond
                        ? 'center'
                        : (isArabic ? 'right' : 'left'));

                final contentAlign = contentStyle['textAlign']?[lang] ??
                    (isFirstOrSecond
                        ? 'center'
                        : (isArabic ? 'right' : 'left'));

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
                    crossAxisAlignment: _textAlignToCrossAxis(titleAlign),
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
                              textAlign: _textAlignFromString(titleAlign),
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
                                fontWeight: contentStyle['fontWeight'] == 'bold'
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                color: HexColor(
                                    contentStyle['color'] ?? '#333333'),
                              ),
                              textAlign: _textAlignFromString(contentAlign),
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
                          textAlign: _textAlignFromString(contentAlign),
                        ),
                    ],
                  ),
                );
              },
            ),
    );
  }

  TextAlign _textAlignFromString(String align) {
    switch (align) {
      case 'right':
        return TextAlign.right;
      case 'center':
        return TextAlign.center;
      case 'left':
      default:
        return TextAlign.left;
    }
  }

  CrossAxisAlignment _textAlignToCrossAxis(String align) {
    switch (align) {
      case 'right':
        return CrossAxisAlignment.end;
      case 'center':
        return CrossAxisAlignment.center;
      case 'left':
      default:
        return CrossAxisAlignment.start;
    }
  }
}

class HexColor extends Color {
  HexColor(final String hex)
      : super(int.parse(hex.replaceFirst('#', '0xff')));
}