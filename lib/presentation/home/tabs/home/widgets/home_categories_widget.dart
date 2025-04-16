import 'package:flowery/core/utils/resources/color_manager.dart';

import 'package:flowery/data/model/home_model/home_model.dart';

import 'package:flowery/presentation/home/tabs/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeCategoriesWidget extends StatelessWidget {
  HomeModel? categories;

  HomeCategoriesWidget(this.categories);

  @override
  Widget build(BuildContext context) {
    var viewModel = BlocProvider.of<HomeViewModel>(context);

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {},
          child: Column(
            children: [
              Container(
                padding:  EdgeInsets.all(16.r),
                margin:  EdgeInsets.symmetric(horizontal: 8.w,vertical: 16.h),

                width: 68.w,
                height: 64.h,
                decoration: BoxDecoration(
                  color: ColorManager.lightPink,
                  borderRadius: BorderRadius.all(Radius.circular(20.r)),
                ),
                child:
                    categories?.categories?[index].image != null
                        ? Image.network(
                          categories!.categories![index].image!,

                        )
                        : CircularProgressIndicator(),
              ),
              Text(categories?.categories?[index].name ?? "loading",style: TextStyle(fontSize: 16.sp),),
            ],
          ),
        );
      },
      itemCount: categories?.categories?.length ?? 0,
    );
  }
}
