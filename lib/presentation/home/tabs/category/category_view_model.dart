import 'package:dio/dio.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/use_case/category_use_case/category_use_case.dart';
import 'package:flowery/domain/use_case/home_use_case/category_product_use_case.dart';
import 'package:flowery/domain/use_case/home_use_case/get_all_product_use_case.dart';
import 'package:flowery/domain/use_case/home_use_case/home_use_case.dart';

import 'package:flowery/presentation/home/tabs/category/category_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

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

  void doIntent(CategoryIntent objCategoryIntent) {
    switch (objCategoryIntent) {
      case Categories():
        {
          getCategories();
          break;
        }
      case LoadCategoriesPageIntent():
        {
          final intent = objCategoryIntent as LoadCategoriesPageIntent;

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
