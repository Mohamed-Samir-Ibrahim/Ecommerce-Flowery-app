import 'package:flowery/core/utils/routes/routes_names.dart';
import 'package:flowery/di/injetible_intinalizer.dart';
import 'package:flowery/domain/entity/Categotries_entity/category_model.dart';
import 'package:flowery/presentation/home/tabs/category/category_states.dart';
import 'package:flowery/presentation/home/tabs/category/category_view_model.dart';
import 'package:flowery/presentation/home/tabs/category/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final categoryViewModel = getIt.get<CategoryViewModel>();
  int selectedTabIndex = 0;
  String searchQuery = '';
  @override
  void initState() {
    super.initState();
    categoryViewModel.getCategories();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => categoryViewModel,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text('Categories', style: TextStyle(color: Colors.black)),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pushNamed(context,RoutesNames.bottomNavScreen),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        setState(() => searchQuery = value);
                      },
                      decoration: InputDecoration(
                        hintText: "Search",
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        contentPadding: const EdgeInsets.all(12),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.filter_list),
                      onPressed: () {
                        // Add filter action
                      },
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 16),

            //  Dynamic Tabs
            BlocBuilder<CategoryViewModel, CategoryStates>(
              builder: (context, state) {
                if (state.status == CategoryStatus.success) {
                  categoryViewModel.fullList = state.Obj_categories ?? [];
                  categoryViewModel.generateTabs(categoryViewModel.fullList);

                  return SizedBox(
                    height: 40,
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      scrollDirection: Axis.horizontal,
                      itemCount: categoryViewModel.dynamicTabs.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 16),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() => selectedTabIndex = index);
                          },
                          child: Column(
                            children: [
                              Text(
                                categoryViewModel.dynamicTabs[index],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: index == selectedTabIndex ? Colors.pink : Colors.grey,
                                ),
                              ),
                              if (index == selectedTabIndex)
                                Container(
                                  margin: const EdgeInsets.only(top: 4),
                                  height: 2,
                                  width: 20,
                                  color: Colors.pink,
                                ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
            const SizedBox(height: 16),

            //  Product Grid
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: BlocBuilder<CategoryViewModel, CategoryStates>(
                  builder: (context, state) {
                    if (state.status == CategoryStatus.loading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state.status == CategoryStatus.success) {
                      List<Categories_entity> categoryList = categoryViewModel.fullList;

                      if (selectedTabIndex != 0) {
                        categoryList = categoryList.where((cat) =>
                        cat.name == categoryViewModel.dynamicTabs[selectedTabIndex]).toList();
                      }


                      if (searchQuery.isNotEmpty) {
                        categoryList = categoryList.where((cat) =>
                        cat.name?.toLowerCase().contains(searchQuery.toLowerCase()) ?? false).toList();
                      }

                      if (categoryList.isEmpty) {
                        return const Center(child: Text("No categories available."));
                      }

                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: categoryList.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 0.65,
                        ),
                        itemBuilder: (context, index) {
                          return ProductCard(category: categoryList[index]);
                        },
                      );
                    } else {
                      return const Center(child: Text("❌ Failed to load categories."));
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
