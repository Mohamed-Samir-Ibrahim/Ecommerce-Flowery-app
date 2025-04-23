import 'package:easy_localization/easy_localization.dart';
import 'package:flowery/core/utils/resources/color_manager.dart';
import 'package:flowery/di/injetible_intinalizer.dart';
import 'package:flowery/presentation/home/tabs/category/category_states.dart';
import 'package:flowery/presentation/home/tabs/category/category_view_model.dart';
import 'package:flowery/presentation/home/tabs/home/widgets/product_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/resources/string_manager.dart';
import '../../../../data/model/home_model/product_by_occasion.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final CategoryViewModel categoryViewModel = getIt.get<CategoryViewModel>();
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    categoryViewModel.doIntent(getAllProducts()); // Fetch all products on init
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => categoryViewModel,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            StringManager.search.tr(),
            style: const TextStyle(color: Colors.black),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                    categoryViewModel.doIntent(SearchIntent(query: value));
                  });
                },
                decoration: InputDecoration(
                  hintText: StringManager.searchForProduct.tr(),
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: const EdgeInsets.all(12),
                ),
              ),
            ),
          BlocBuilder<CategoryViewModel, CategoryStates>(
                builder: (context, state) {
                  if (searchQuery.isEmpty) {
                    return Center(
                      heightFactor: 20.h,
                      child: Text(
                        StringManager.searchForProduct.tr(),
                        style: TextStyle(fontSize: 18.sp, color: Colors.grey),
                      ),
                    );
                  }

                  if (state.status == CategoryStatus.loading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state.status == CategoryStatus.success) {
                    final filteredProducts = state.filteredProducts ?? [];
                    if (filteredProducts.isEmpty) {
                      return Center(
                        child: Text(
                          StringManager.noDataFound.tr(),
                          style: TextStyle(fontSize: 18.sp, color: Colors.grey),
                        ),
                      );
                    }

                    return Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                StringManager.products.tr(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 8.h),

                             ProductItems(
                              state: state.copyWith(
                                products: ProductByOccasion(products: filteredProducts),
                              ),
                            ),
                        ],
                      ),
                    );
                  }
                  return  Center(child: Text(
                    StringManager.noDataFound.tr(),
                  ));
                },
              ),

          ],
        ),
      ),
    );
  }
}