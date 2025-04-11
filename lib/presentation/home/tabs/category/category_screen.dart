import 'package:flowery/di/injetible_intinalizer.dart';
import 'package:flowery/domain/entity/Categotries_entity/category_model.dart';
import 'package:flowery/presentation/home/tabs/category/category_states.dart';
import 'package:flowery/presentation/home/tabs/category/category_view_model.dart';
import 'package:flowery/presentation/home/tabs/category/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});

  final categoryViewModel = getIt.get<CategoryViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => categoryViewModel..getCategories(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Categories"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: BlocBuilder<CategoryViewModel, CategoryStates>(
                  builder: (context, state) {
                    if (state.status == CategoryStatus.loading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state.status == CategoryStatus.success) {
                      final List<Categories_entity> categoryList = state.Obj_categories ?? [];
                      if (categoryList.isEmpty) {
                        return const Center(child: Text(" No categories available."));
                      }
                      return GridView.builder(  // حذف Expanded من هنا
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.7,
                        ),
                        itemCount: categoryList.length,
                        itemBuilder: (context, index) {
                          final category = categoryList[index];
                          return ProductCard(category: category);
                        },
                      );
                    } else if (state.status == CategoryStatus.error) {
                      return const Center(child: Text("❌ Failed to load categories."));
                    } else {
                      return const SizedBox();
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