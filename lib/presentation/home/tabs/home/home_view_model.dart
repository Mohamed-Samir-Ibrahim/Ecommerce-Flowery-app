import 'package:flowery/domain/common/api_result.dart';

import 'package:flowery/domain/use_case/home_use_case/home_use_case.dart';
import 'package:flowery/domain/use_case/home_use_case/occasion_product_use_case.dart';

import 'package:flowery/presentation/home/tabs/home/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class HomeViewModel extends Cubit<HomeStates> {
  HomeUseCase homeUseCase;
  OccasionProductUseCase occasionProductUseCase;
  HomeViewModel(this.homeUseCase,this.occasionProductUseCase) : super(HomeStates(status: Status.loading));

  void _getHomeScreen() async {
    emit(state.copyWith(status: Status.loading));
    var result = await homeUseCase.invoke();
    switch (result) {
      case Success():
        {
          var res = result.data;
          emit(state.copyWith(status: Status.success, home: res));
        }
      case Error():
        {
          var e = result.exception;
          emit(state.copyWith(status: Status.error, exception: e));
        }
    }
  }
  void _occasionProduc(String occasionId) async {
    emit(state.copyWith(status: Status.loading));
    var result = await occasionProductUseCase.invoke(occasionId);
    switch (result) {
      case Success():
        {
          print("yesssssssssssssssss");
          var res = result.data;
          print(res);
          print(res?.message);
          emit(state.copyWith(status: Status.success, products: res!));
        }
      case Error():
        {
          print("noooooooooooooooo");
          var e = result.exception;
          emit(state.copyWith(status: Status.error, exception: e));
        }
    }
  }

  void _loadHomePage() {
    _getHomeScreen();
  }

  void doIntent(HomeIntent homeIntent) {
    switch (homeIntent) {
      case LoadHomePageIntent():
        {
          _loadHomePage();
        }
      case LoadOccasionPageIntent():
        {
          final intent = homeIntent;

          _occasionProduc(intent.occasionId);
        }
    }
  }
}

sealed class HomeIntent {}

class LoadHomePageIntent extends HomeIntent {}
class LoadOccasionPageIntent extends HomeIntent {
  final String occasionId;

  LoadOccasionPageIntent({required this.occasionId});
}
