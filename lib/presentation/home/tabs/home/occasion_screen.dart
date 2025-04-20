import 'package:easy_localization/easy_localization.dart';
import 'package:flowery/core/utils/resources/color_manager.dart';
import 'package:flowery/di/injetible_intinalizer.dart';
import 'package:flowery/presentation/home/tabs/home/home_states.dart';
import 'package:flowery/presentation/home/tabs/home/home_view_model.dart';
import 'package:flowery/presentation/home/tabs/home/widgets/product_items.dart';
import 'package:flowery/presentation/home/tabs/home/widgets/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/resources/string_manager.dart';

class OccasionScreen extends StatefulWidget {
  OccasionScreen({super.key});

  @override
  State<OccasionScreen> createState() => _OccasionScreenState();
}

class _OccasionScreenState extends State<OccasionScreen> {
  HomeViewModel homeViewModel = getIt.get<HomeViewModel>();
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    homeViewModel.doIntent(LoadHomePageIntent());
    homeViewModel.doIntent(
      LoadOccasionPageIntent(occasionId: "673b34c21159920171827ae0"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeViewModel,

      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(StringManager.occasion.tr(), style: TextStyle(fontSize: 22.sp)),
                Text(
                  StringManager.bestSellerDesc.tr(),
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.lightGrey,
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
                    return Column(
                      children: [
                        DefaultTabController(
                          length: state.home?.occasions?.length ?? 0,
                          child: TabBar(
                            isScrollable: true,
                            indicatorColor: Colors.transparent,
                            dividerColor: Colors.transparent,
                            onTap: (index) {
                              setState(() {
                                selectedIndex = index;
                              });
                              homeViewModel.doIntent(
                                LoadOccasionPageIntent(
                                  occasionId:
                                      state
                                          .home
                                          ?.occasions?[selectedIndex]
                                          .id ??
                                      "",
                                ),
                              );
                            },
                            tabs:
                                state.home?.occasions
                                    ?.map(
                                      (occasion) => TabItem(
                                        occasion: occasion,
                                        isSelected:
                                            state.home!.occasions!.indexOf(
                                              occasion,
                                            ) ==
                                            selectedIndex,
                                      ),
                                    )
                                    .toList() ??
                                [],
                          ),
                        ),
                        state.products?.products?.length != 0
                            ? ProductItems(state: state)
                            : Center(child: Text(StringManager.noDataFound.tr())),
                      ],
                    );
                  }
              }
            },
          ),
        ),
      ),
    );
  }
}


