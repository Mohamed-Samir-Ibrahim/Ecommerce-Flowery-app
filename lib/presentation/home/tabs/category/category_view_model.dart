import 'package:dio/dio.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/use_case/category_use_case/category_use_case.dart';
import 'package:flowery/domain/use_case/home_use_case/category_product_use_case.dart';
import 'package:flowery/domain/use_case/home_use_case/get_all_product_use_case.dart';
import 'package:flowery/domain/use_case/home_use_case/home_use_case.dart';

import 'package:flowery/presentation/home/tabs/category/category_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../data/model/home_model/product_by_occasion.dart';
import '../../../../domain/entity/Categotries_entity/category_model.dart';

@injectable
class CategoryViewModel extends Cubit<CategoryStates> {
  final CategoryUseCase obj_category_use_case;
  CategoryProductUseCase categoryProductUseCase;
  GetAllProductUseCase getAllProductUseCase ;
  HomeUseCase homeUseCase;

  CategoryViewModel(this.homeUseCase,this.obj_category_use_case, this.categoryProductUseCase,this.getAllProductUseCase)
    : super(CategoryStates(status: CategoryStatus.initial));

  List<String> dynamicTabs = ['All'];
  List<Categories_entity> fullList = [];
  void _getHomeScreen() async {
    emit(state.copyWith(status: CategoryStatus.loading));
    var result = await homeUseCase.invoke();
    switch (result) {
      case Success():
        {
          print("ssssssssssssssssssssssss");
          var res = result.data;
          emit(state.copyWith(status: CategoryStatus.success, home: res));
        }
      case Error():
        {
          print("xxxxxxxxxxxxxxxxxxxxxxx");

          var e = result.exception;
          emit(state.copyWith(status: CategoryStatus.error, exception: e));
        }
    }
  }
  void getCategories() async {
    emit(state.copyWith(status: CategoryStatus.loading));

    var result = await obj_category_use_case.invoke();

    switch (result) {
      case Success():
        {
          fullList = result.data ?? [];
          generateTabs(fullList);
          emit(
            state.copyWith(
              status: CategoryStatus.success,
              Obj_categories: fullList,
            ),
          );
          print("✅ Categories State: ${state.status}, Data: ${result.data}");
        }
      case Error():
        {
          var e = result.exception;
          emit(state.copyWith(status: CategoryStatus.error, exception: e));
          print("❌ Category Fetch Error: $e");

          if (e is DioException) {
            final responseData = e.response?.data;
            final statusCode = e.response?.statusCode;
            print("🛑 DioException Response: $responseData");
            print("📛 Status Code: $statusCode");
          } else {
            print("🛑 Non-Dio Exception: ${e.toString()}");
          }
        }
    }
  }

  void generateTabs(List<Categories_entity> categories) {
    final names = categories.map((e) => e.name ?? '').toSet().toList();
    names.removeWhere((element) => element.isEmpty);
    dynamicTabs = ['All', ...names];
  }

  List<Categories_entity> filterCategories(
    String searchQuery,
    int selectedTabIndex,
  ) {
    List<Categories_entity> filteredList = fullList;

    if (selectedTabIndex != 0) {
      filteredList =
          filteredList
              .where((cat) => cat.name == dynamicTabs[selectedTabIndex])
              .toList();
    }

    if (searchQuery.isNotEmpty) {
      filteredList =
          filteredList
              .where(
                (cat) =>
                    cat.name?.toLowerCase().contains(
                      searchQuery.toLowerCase(),
                    ) ??
                    false,
              )
              .toList();
    }

    return filteredList;
  }

  void _categoryProduc(String categoryId) async {
    emit(state.copyWith(status: CategoryStatus.loading));
    var result = await categoryProductUseCase.invoke(categoryId);
    switch (result) {
      case Success():
        {
          print("yesssssssssssssssss");
          var res = result.data;
          print(res);
          print(res?.message);
          emit(state.copyWith(status: CategoryStatus.success, products: res!));
        }
      case Error():
        {
          print("noooooooooooooooo");
          var e = result.exception;
          emit(state.copyWith(status: CategoryStatus.error, exception: e));
        }
    }
  }
  void _getAllProducts() async {
    emit(state.copyWith(status: CategoryStatus.loading));
    var result = await getAllProductUseCase.invoke();
    switch (result) {
      case Success():
        {
          print("yesssssssssssssssss");
          var res = result.data;
          print(res);
          print(res?.message);
          emit(state.copyWith(status: CategoryStatus.success, products: res!));
        }
      case Error():
        {
          print("noooooooooooooooo");
          var e = result.exception;
          emit(state.copyWith(status: CategoryStatus.error, exception: e));
        }
    }
  }
  void _search(String query) async {
    // If products are not loaded, fetch them
    if (state.products == null || state.products!.products == null) {
      _getAllProducts();
      return;
    }

    // Filter products
    final products = state.products?.products ?? [];
    final filteredProducts = products.where((product) {
      final name = product.title?.toLowerCase() ?? '';
      return name.contains(query.toLowerCase());
    }).toList();

    emit(state.copyWith(
      searchQuery: query,
      filteredProducts: filteredProducts,
      status: CategoryStatus.success,
    ));
  }
void _filterProducts({required double minPrice, required double maxPrice, String? sortBy}) async {
    emit(state.copyWith(status: CategoryStatus.loading));
    final products = state.products?.products ?? [];

    // 1. Filter by price
    List<ProductsBean> filtered = products.where((product) {
      final price = product.priceAfterDiscount ?? product.price ?? 0;
      return price >= minPrice && price <= maxPrice;
    }).toList();

    // 2. Apply sorting
    switch (sortBy) {
      case 'highest_price':
        filtered.sort((a, b) => ((b.priceAfterDiscount ?? b.price ?? 0).compareTo(a.priceAfterDiscount ?? a.price ?? 0)));
        break;
      case 'lowest_price':
        filtered.sort((a, b) => ((a.priceAfterDiscount ?? a.price ?? 0).compareTo(b.priceAfterDiscount ?? b.price ?? 0)));
        break;
      case 'new':
        filtered.sort((a, b) => DateTime.parse(b.createdAt ?? "").compareTo(DateTime.parse(a.createdAt ?? "")));
        break;
      case 'old':
        filtered.sort((a, b) => DateTime.parse(a.createdAt ?? "").compareTo(DateTime.parse(b.createdAt ?? "")));
        break;
      case 'discount':
        filtered.sort((a, b) => ((b.discount ?? 0).compareTo(a.discount ?? 0)));
        break;
    }
    final updatedProductByOccasion = ProductByOccasion(
      message: state.products?.message,
      metadata: state.products?.metadata,
      products: filtered,
    );

    emit(state.copyWith(status: CategoryStatus.success, products: updatedProductByOccasion, filteredProducts: filtered));
}

  void doIntent(CategoryIntent objCategoryIntent) {
    switch (objCategoryIntent) {
      case Categories():
        {
          getCategories();
          break;
        }
      case LoadCategoriesPageIntent():
        {
          final intent = objCategoryIntent;

          _categoryProduc(intent.categoryId);
        }
      case getAllProducts():
        {
          _getAllProducts();
        }
      case LoadHomePageIntent():
        {
          _getHomeScreen();
        }
        case FilterProductsIntent():
        {
          _filterProducts(
            minPrice: objCategoryIntent.minPrice,
            maxPrice: objCategoryIntent.maxPrice,
            sortBy: objCategoryIntent.sortBy,
          );
          break;
        }
      case SearchIntent():
        {
          _search(objCategoryIntent.query);
          break;
        }
    }
  }
}


sealed class CategoryIntent {}

class Categories extends CategoryIntent {}
class getAllProducts extends CategoryIntent {}

class LoadCategoriesPageIntent extends CategoryIntent {
  final String categoryId;

  LoadCategoriesPageIntent({required this.categoryId});
}
class LoadHomePageIntent extends CategoryIntent {}
class FilterProductsIntent extends CategoryIntent {
  final double minPrice;
  final double maxPrice;
  final String? sortBy; // 'highest_price', 'lowest_price', 'new', 'old', 'discount'

  FilterProductsIntent({
    required this.minPrice,
    required this.maxPrice,
    this.sortBy,
  });
}

class SearchIntent extends CategoryIntent {
  final String query;

  SearchIntent({required this.query});
}