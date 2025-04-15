import 'package:flowery/di/injetible_intinalizer.dart';
import 'package:flowery/domain/entity/Categotries_entity/category_model.dart';
import 'package:flowery/presentation/home/tabs/category/category_states.dart';
import 'package:flowery/presentation/home/tabs/category/category_view_model.dart';
import 'package:flowery/presentation/home/tabs/category/product_card.dart';
import 'package:flowery/presentation/home/tabs/home/occasion_screen.dart';
import 'package:flowery/presentation/home/tabs/home/widgets/product_items.dart';
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
    categoryViewModel.doIntent(
        getAllProducts());
    categoryViewModel.doIntent(
        LoadHomePageIntent());
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => categoryViewModel,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text('', style: TextStyle(color: Colors.black)),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
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

                            selectedTabIndex==0?categoryViewModel.doIntent(getAllProducts()):
                            categoryViewModel.doIntent(
                              LoadCategoriesPageIntent(
                                categoryId:
                                state.home?.categories?[selectedTabIndex-1].id ?? "",
                              ),
                            );
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
            BlocBuilder<CategoryViewModel, CategoryStates>(
              builder: (context, state) {
                if (state.status == CategoryStatus.loading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state.status == CategoryStatus.success) {

                  return state.products?.products?.length!=0? ProductItems(state: state):Center(child:Text("No Data To Show"),);
                } else {
                  return const Center(child: Text("❌ Failed to load categories."));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
