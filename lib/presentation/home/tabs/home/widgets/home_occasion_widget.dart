import 'package:flowery/core/utils/resources/color_manager.dart';
import 'package:flowery/data/model/home_model/home_model.dart';
import 'package:flowery/presentation/home/tabs/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeOccasionWidget extends StatelessWidget {
  HomeModel? occasion;

  HomeOccasionWidget(this.occasion);

  @override
  Widget build(BuildContext context) {
    var viewModel = BlocProvider.of<HomeViewModel>(context);

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(

                  width: 131.w,
                  height: 151.h,
                  child:
                  occasion?.occasions?[index].image != null
                      ? Image.network(
                    occasion!.occasions![index].image!,
                    height: 24.h,
                    width: 24.w,
                  )
                      :
                  CircularProgressIndicator(),
                ),
                Text(occasion?.occasions?[index].name ?? "loading",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.sp),),
              ],
            ),
          ),
        );
      },
      itemCount: occasion?.occasions?.length ?? 0,
    );
  }
}
