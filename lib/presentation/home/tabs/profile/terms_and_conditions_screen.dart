import 'package:easy_localization/easy_localization.dart';
import 'package:flowery/di/injetible_intinalizer.dart';
import 'package:flowery/presentation/home/tabs/profile/terms/terms_cubit.dart';
import 'package:flowery/presentation/home/tabs/profile/terms/terms_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = context.locale.languageCode;
    final bool isArabic = lang == 'ar';

    return BlocProvider(
      create: (context) => getIt<TermsCubit>()..fetchTerms(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: Text('terms_and_conditions'.tr())),
        body: BlocBuilder<TermsCubit, TermsState>(
          builder: (context, state) {
            if (state is TermsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is TermsLoaded) {
              final sections = state.terms;

              return ListView.builder(
                padding: EdgeInsets.all(16.r),
                itemCount: sections.length,
                itemBuilder: (context, index) {
                  final section = sections[index];
                  final isList = section.content[lang] is List;
                  final contentItems = section.content[lang];
                  final isFirstOrSecond = index == 0 || index == 1;

                  final style = section.style;
                  final titleStyle = style['title'] ?? style;
                  final contentStyle = style['content'] ?? style;

                  final titleAlign = titleStyle['textAlign']?[lang] ??
                      (isFirstOrSecond ? 'center' : (isArabic ? 'right' : 'left'));
                  final contentAlign = contentStyle['textAlign']?[lang] ??
                      (isFirstOrSecond ? 'center' : (isArabic ? 'right' : 'left'));

                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 10.h),
                    padding: EdgeInsets.all(10.r),
                    color: HexColor((titleStyle['backgroundColor'] ?? style['backgroundColor'] ?? '#FFFFFF').toString()),
                    child: Column(
                      crossAxisAlignment: _textAlignToCrossAxis(titleAlign),
                      children: [
                        if (section.title != null)
                          Row(
                            children: [
                              Text(
                                section.title?[lang] ?? '',
                                style: TextStyle(
                                  fontSize: (titleStyle['fontSize'] ?? 18.sp).toDouble(),
                                  fontWeight: titleStyle['fontWeight'] == 'bold' ? FontWeight.bold : FontWeight.normal,
                                  color: HexColor(titleStyle['color'] ?? '#000000'),
                                ),
                                textAlign: _textAlignFromString(titleAlign),
                              ),
                            ],
                          ),
                        SizedBox(height: 10.h),
                        if (isList && contentItems != null)
                          ...List.generate(contentItems.length, (i) {
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 4.h),
                              child: Text(
                                contentItems[i],
                                style: TextStyle(
                                  fontSize: (contentStyle['fontSize'] ?? 16.sp).toDouble(),
                                  fontWeight: contentStyle['fontWeight'] == 'bold' ? FontWeight.bold : FontWeight.normal,
                                  color: HexColor(contentStyle['color'] ?? '#333333'),
                                ),
                                textAlign: _textAlignFromString(contentAlign),
                              ),
                            );
                          })
                        else if (contentItems is String)
                          Text(
                            contentItems,
                            style: TextStyle(
                              fontSize: (contentStyle['fontSize'] ?? 16.sp).toDouble(),
                              fontWeight: contentStyle['fontWeight'] == 'bold' ? FontWeight.bold : FontWeight.normal,
                              color: HexColor(contentStyle['color'] ?? '#333333'),
                            ),
                            textAlign: _textAlignFromString(contentAlign),
                          ),
                      ],
                    ),
                  );
                },
              );
            } else if (state is TermsError) {
              return Center(child: Text(state.message));
            } else {
              return const SizedBox();
            }
          },
        ),
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
  HexColor(final String hex) : super(int.parse(hex.replaceFirst('#', '0xff')));
}