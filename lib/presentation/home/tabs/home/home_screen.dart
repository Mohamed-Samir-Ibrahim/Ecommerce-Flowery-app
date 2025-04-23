import 'package:easy_localization/easy_localization.dart';
import 'package:flowery/core/utils/resources/color_manager.dart';
import 'package:flowery/di/injetible_intinalizer.dart';
import 'package:flowery/presentation/home/tabs/home/home_states.dart';
import 'package:flowery/presentation/home/tabs/home/home_view_model.dart';
import 'package:flowery/presentation/home/tabs/home/occasion_screen.dart';
import 'package:flowery/presentation/home/tabs/home/widgets/home_best_seller_widget.dart';
import 'package:flowery/presentation/home/tabs/home/widgets/home_categories_widget.dart';
import 'package:flowery/presentation/home/tabs/home/widgets/home_occasion_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/resources/string_manager.dart';
import '../../../../core/utils/routes/routes_names.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel homeViewModel = getIt.get<HomeViewModel>();
String searchQuery = '';
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
                Text(StringManager.appName.tr(), style: TextStyle(color: ColorManager.primary)),
                SizedBox(width: 17.w),
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      setState(() => searchQuery = value);
                    },
                    decoration: InputDecoration(
                      hintText: StringManager.search.tr(),
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: const EdgeInsets.all(12),
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
                        child: Text(StringManager.error.tr()),
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
                                Text(StringManager.categories.tr(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24.sp)),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, RoutesNames.categoriesView);
                                  },
                                  child: Text(
                                    StringManager.viewAll.tr(),
                                    style: TextStyle(color: ColorManager.primary,fontSize: 16.sp),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 140.h,child: HomeCategoriesWidget(state.home)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(StringManager.bestSeller.tr(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24.sp)),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, RoutesNames.mostSellingScreen);
                                  },
                                  child: Text(
                                    StringManager.viewAll.tr(),
                                    style: TextStyle(color: ColorManager.primary,fontSize: 16.sp),
                                  ),
                                ),
                              ],
                            ),
                        SizedBox( height: 220.h,child: HomeBestSellerWidget(state.home)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(StringManager.occasion.tr(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24.sp)),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => OccasionScreen(),));
                                  },
                                  child: Text(
                                   StringManager.viewAll.tr(),
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
