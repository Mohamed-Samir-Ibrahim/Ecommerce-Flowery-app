import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key});

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  List<dynamic> sections = [];

  @override
  void initState() {
    super.initState();
    loadTermsJson();
  }

  Future<void> loadTermsJson() async {
    final jsonStr = await rootBundle.loadString('assets/Flowery Terms and Conditions JSON with Arabic and English.json');
    final data = json.decode(jsonStr);
    setState(() {
      sections = data['terms_and_conditions'] ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    final lang = context.locale.languageCode;
    final bool isArabic = lang == 'ar';

    return Scaffold(
      appBar: AppBar(
        title: Text(isArabic ? 'الشروط والأحكام' : 'Terms & Conditions'),
      ),
      body: sections.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              padding: EdgeInsets.all(16.r),
              itemCount: sections.length,
              separatorBuilder: (_, __) => SizedBox(height: 24.h),
              itemBuilder: (context, index) {
                final section = sections[index];
                final String? title = section['title']?[lang];
                final dynamic content = section['content']?[lang];
                final Map<String, dynamic> style = section['style'] ?? {};

                final Map<String, dynamic> titleStyle = style['title'] ?? style;
                final Map<String, dynamic> contentStyle = style['content'] ?? style;

                return Column(
                  crossAxisAlignment: isArabic ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                  children: [
                    if (title != null) ...[
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: (titleStyle['fontSize'] ?? 20.sp).toDouble(),
                          fontWeight: titleStyle['fontWeight'] == 'bold'
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: HexColor(titleStyle['color'] ?? '#000000'),
                        ),
                        textAlign: isArabic ? TextAlign.right : TextAlign.left,
                      ),
                      SizedBox(height: 10.h),
                    ],
                    if (content is String)
                      Text(
                        content,
                        style: TextStyle(
                          fontSize: (contentStyle['fontSize'] ?? 16.sp).toDouble(),
                          fontWeight: contentStyle['fontWeight'] == 'bold'
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: HexColor(contentStyle['color'] ?? '#333333'),
                        ),
                        textAlign: isArabic ? TextAlign.right : TextAlign.left,
                      ),
                    if (content is List)
                      Column(
                        crossAxisAlignment: isArabic ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                        children: content
                            .map<Widget>(
                              (item) => Padding(
                                padding: EdgeInsets.symmetric(vertical: 6.h),
                                child: Text(
                                  item,
                                  style: TextStyle(
                                    fontSize: (contentStyle['fontSize'] ?? 16.sp).toDouble(),
                                    fontWeight: contentStyle['fontWeight'] == 'bold'
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                    color: HexColor(contentStyle['color'] ?? '#333333'),
                                  ),
                                  textAlign: isArabic ? TextAlign.right : TextAlign.left,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                  ],
                );
              },
            ),
    );
  }
}

class HexColor extends Color {
  HexColor(final String hexColor)
      : super(int.parse(hexColor.replaceFirst('#', '0xff')));
}
