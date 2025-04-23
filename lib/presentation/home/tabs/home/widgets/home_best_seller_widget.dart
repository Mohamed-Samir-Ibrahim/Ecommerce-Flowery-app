
import 'package:flowery/data/model/home_model/home_model.dart';
import 'package:flowery/presentation/home/tabs/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBestSellerWidget extends StatelessWidget {
  HomeModel? bestSeller;

  HomeBestSellerWidget(this.bestSeller);

  @override
  Widget build(BuildContext context) {
    var viewModel = BlocProvider.of<HomeViewModel>(context);

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(

                  width: 131.w,
                  height: 151.h,

                  child:
                      bestSeller?.bestSeller?[index].imgCover != null
                          ? Image.network(
                            bestSeller!.bestSeller![index].imgCover!,

                          )
                          : CircularProgressIndicator(),
                ),
                Text(bestSeller?.bestSeller?[index].title ?? "loading",style: TextStyle(fontSize: 16.sp),),
                Text(
                  bestSeller?.bestSeller?[index].price.toString() ?? "loading",
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.sp),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: bestSeller?.bestSeller?.length ?? 0,
    );
  }
}
