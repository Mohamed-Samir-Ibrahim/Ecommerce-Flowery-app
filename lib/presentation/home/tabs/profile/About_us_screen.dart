import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Aboutus extends StatefulWidget {
  const Aboutus({super.key});

  @override
  State<Aboutus> createState() => _AboutusState();
}

class _AboutusState extends State<Aboutus> {
  List<dynamic> sections = [];

  @override
  void initState() {
    super.initState();
    loadAboutJson();
  }

  Future<void> loadAboutJson() async {
    final jsonStr = await rootBundle.loadString('assets/Flowery About Section JSON with Expanded Content.json');
    final data = json.decode(jsonStr);
    setState(() {
      sections = data['about_app'] ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    final lang = context.locale.languageCode;
    final bool isArabic = lang == 'ar';
    return Scaffold(
        appBar: AppBar(
          title: Text(context.locale == Locale('ar') ? 'عن التطبيق' : 'About the App'),
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
    
                  final Map<String, dynamic> titleStyle =
                      style['title'] ?? style;
                  final Map<String, dynamic> contentStyle =
                      style['content'] ?? style;
    
                  return Column(
                  crossAxisAlignment: context.locale == Locale('ar') ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                    children: [
                      if (title != null) ...[
                        Text(
                          title,
                          style: TextStyle(
                            fontSize:
                                (titleStyle['fontSize'] ?? 20.sp).toDouble(),
                            fontWeight: titleStyle['fontWeight'] == 'bold'
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color: HexColor(titleStyle['color'] ?? '#000000'),
                          ),
                          textAlign: context.locale == Locale('ar') ? TextAlign.right : TextAlign.left,
                        ),
                        SizedBox(height: 10.h),
                      ],
                      if (content is String)
                        Text(
                          content,
                          style: TextStyle(
                            fontSize:
                                (contentStyle['fontSize'] ?? 16.sp).toDouble(),
                            fontWeight: contentStyle['fontWeight'] == 'bold'
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color: HexColor(contentStyle['color'] ?? '#333333'),
                          ),
                          textAlign: context.locale == Locale('ar') ? TextAlign.right : TextAlign.left,
                        ),
                      if (content is List)
                        Column(
                          crossAxisAlignment:
                          context.locale == Locale('ar') ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                          children: content
                              .map<Widget>(
                                (item) => Padding(
                                  padding: EdgeInsets.symmetric(vertical: 6.h),
                                  child: Text(
                                    item,
                                    style: TextStyle(
                                      fontSize: (contentStyle['fontSize'] ?? 16.sp)
                                          .toDouble(),
                                      fontWeight:
                                          contentStyle['fontWeight'] == 'bold'
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                      color: HexColor(
                                          contentStyle['color'] ?? '#333333'),
                                    ),
                                    textAlign:
                                    context.locale == Locale('ar') ? TextAlign.right : TextAlign.left,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                    ],
                  );
                },
              ),);
  }
}

class HexColor extends Color {
  HexColor(final String hexColor)
      : super(int.parse(hexColor.replaceFirst('#', '0xff')));
}