// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/use_case/category_use_case/category_use_case.dart';
import 'package:flowery/presentation/home/tabs/category/category_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CategoryViewModel extends Cubit<CategoryStates> {
  CategoryUseCase obj_category_use_case;

  CategoryViewModel(this.obj_category_use_case)
      : super(CategoryStates(status: CategoryStatus.initial));

  void getCategories() async {
    emit(state.copyWith(status: CategoryStatus.loading));

    var result = await obj_category_use_case.invoke();

    switch (result) {
      case Success():
        {
          emit(state.copyWith(
            status: CategoryStatus.success,
            Obj_categories: result.data,
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