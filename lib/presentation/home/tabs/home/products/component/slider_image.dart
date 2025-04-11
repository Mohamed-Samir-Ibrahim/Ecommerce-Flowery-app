import 'package:cached_network_image/cached_network_image.dart';
import 'package:flowery/core/utils/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliderImage extends StatelessWidget {
  const SliderImage({super.key, required this.imageUrls});
  final List<String?>imageUrls;

  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      width: double.infinity,
      height: 448.h,
      initialPage: 0,
      indicatorPadding: 15,
      indicatorColor: ColorManager.primary,
      indicatorBackgroundColor: ColorManager.white,
      isLoop: true,
      autoPlayInterval: null,
      children: imageUrls.map((url) {
        return CachedNetworkImage(imageUrl: url??'',);
      }).toList(),
    );
  }
}