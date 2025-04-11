import 'package:dio/dio.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/use_case/category_use_case/category_use_case.dart';
import 'package:flowery/presentation/home/tabs/category/category_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entity/Categotries_entity/category_model.dart';

@injectable
class CategoryViewModel extends Cubit<CategoryStates> {
  final CategoryUseCase obj_category_use_case;

  CategoryViewModel(this.obj_category_use_case)
      : super(CategoryStates(status: CategoryStatus.initial));

  List<String> dynamicTabs = ['All'];
  List<Categories_entity> fullList = [];

  void getCategories() async {
    emit(state.copyWith(status: CategoryStatus.loading));

    var result = await obj_category_use_case.invoke();

    switch (result) {
      case Success():
        {
          fullList = result.data ?? [];
          generateTabs(fullList);
          emit(state.copyWith(
            status: CategoryStatus.success,
            Obj_categories: fullList,
          ));
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

  List<Categories_entity> filterCategories(String searchQuery, int selectedTabIndex) {
    List<Categories_entity> filteredList = fullList;

    if (selectedTabIndex != 0) {
      filteredList = filteredList.where((cat) => cat.name == dynamicTabs[selectedTabIndex]).toList();
    }

    if (searchQuery.isNotEmpty) {
      filteredList = filteredList.where((cat) => cat.name?.toLowerCase().contains(searchQuery.toLowerCase()) ?? false).toList();
    }

    return filteredList;
  }

  void doIntent(CategoryIntent objCategoryIntent) {
    switch (objCategoryIntent) {
      case Categories():
        getCategories();
        break;
    }
  }
}

sealed class CategoryIntent {}

class Categories extends CategoryIntent {}
