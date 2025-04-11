import 'package:flowery/core/utils/resources/color_manager.dart';
import 'package:flowery/di/injetible_intinalizer.dart';
import 'package:flowery/presentation/home/tabs/home/home_states.dart';
import 'package:flowery/presentation/home/tabs/home/home_view_model.dart';
import 'package:flowery/presentation/home/tabs/home/widgets/home_best_seller_widget.dart';
import 'package:flowery/presentation/home/tabs/home/widgets/home_categories_widget.dart';
import 'package:flowery/presentation/home/tabs/home/widgets/home_occasion_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel homeViewModel = getIt.get<HomeViewModel>();

  @override
  void initState() {
    super.initState();
    homeViewModel.doIntent(LoadHomePageIntent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeViewModel,

      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                Image.asset("assets/icon/flower.png"),
                SizedBox(width: 4.w),
                Text("Flowery", style: TextStyle(color: ColorManager.primary)),
                SizedBox(width: 17.w),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorManager.white70,
                        width: 1.w,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(8.r)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0.w),
                      child: Row(
                        children: [
                          Icon(Icons.search, color: ColorManager.white70),
                          Text(
                            "Search",
                            style: TextStyle(color: ColorManager.white70),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: BlocConsumer<HomeViewModel, HomeStates>(
            listener: (context, state) {},
            builder: (context, state) {
              switch (state.status) {
                case Status.loading:
                  {
                    return Center(child: CircularProgressIndicator());
                  }
                case Status.error:
                  {
                    return Center(
                      child: TextButton(
                        onPressed: () {
                          homeViewModel.doIntent(LoadHomePageIntent());
                        },
                        child: Text("Error Try Again"),
                      ),
                    );
                  }
                case Status.success:
                  {
                    return SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(12.w),
                        child: Column(
                      
                          children: [
                            Row(
                              children: [
                                Icon(Icons.location_on_outlined),
                                Text("Deliver to 2XVP+XC - Sheikh Zayed"),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.keyboard_arrow_down,
                                    color: ColorManager.primary,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Categories",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24.sp)),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "View All",
                                    style: TextStyle(color: ColorManager.primary,fontSize: 16.sp),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 140.h,child: HomeCategoriesWidget(state.home)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Best seller",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24.sp)),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "View All",
                                    style: TextStyle(color: ColorManager.primary,fontSize: 16.sp),
                                  ),
                                ),
                              ],
                            ),
                        SizedBox( height: 220.h,child: HomeBestSellerWidget(state.home)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Occasion",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24.sp)),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "View All",
                                    style: TextStyle(color: ColorManager.primary,fontSize: 16.sp),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height:220.h,child: HomeOccasionWidget(state.home)),
                          ],
                        ),
                      ),
                    );
                  }
              }
            },
          ),
          backgroundColor: ColorManager.white,
        ),
      ),
    );
  }
}
