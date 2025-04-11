
import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/entity/home_entity/best_seller_entity/best_seller_entity.dart';
import 'package:flowery/domain/use_case/home_use_case/product_use_case.dart';


import 'package:flowery/domain/common/api_result.dart';

import 'package:flowery/domain/use_case/home_use_case/home_use_case.dart';

import 'package:flowery/presentation/home/tabs/home/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/use_case/home_use_case/best_seller_use_case.dart';
@singleton
class HomeViewModel extends Cubit<HomeStates> {
  bestSellerUseCase BestSeller;
  ProductUseCase productUseCase;

  HomeViewModel({required this.BestSeller,required this.productUseCase}):super(Initial());

  void BestSellerget()async{
    var response=await  BestSeller.get();
emit(IsLoadingBestSeller());
    switch(response){
      case Success():{
        var data = await response.data;
        emit(SuccessBestSeller(bestSellerEntity: data!));

      }
      case Error():{
emit(ErrorBestSeller());

      }

    }
  }

  void productGet()async{
    var response=await  productUseCase.getAllProducts();
emit(IsLoadingProduct());
    switch(response){
      case Success():{
        var data = await response.data;
        emit(SuccessProduct(productResponseDto: data!));

      }
      case Error():{
emit(ErrorProduct());

      }

    }
  }

  dointent(HomeIntent home) {
    switch (home) {
      case BestSellerScreen():{

        BestSellerget();

      }
      case ProductScreen():{

        productGet();

      }
    }
  }

}

sealed class HomeIntent{
}

class BestSellerScreen extends HomeIntent {}
class ProductScreen extends HomeIntent {}


@singleton
class HomeViewModel extends Cubit<HomeStates> {
  HomeUseCase homeUseCase;

  HomeViewModel(this.homeUseCase) : super(HomeStates(status: Status.loading));
  void _getHomeScreen() async {
    emit(state.copyWith(status: Status.loading));
    var result= await homeUseCase.invoke();
    switch(result){
      case Success():{
        var res=result.data;
        emit(state.copyWith(status: Status.success,home: res));
      }
      case Error():{
        var e=result.exception;
        emit(state.copyWith(status: Status.error,exception: e));

      }
    }


  }
  void _loadHomePage(){
    _getHomeScreen();
  }
  void doIntent(HomeIntent homeIntent){
    switch(homeIntent){

      case LoadHomePageIntent():{
        _loadHomePage();
      }
    }
  }
}
sealed class HomeIntent{
}


class LoadHomePageIntent extends HomeIntent{

}


