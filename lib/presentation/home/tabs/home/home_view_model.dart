import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/entity/home_entity/best_seller_entity/best_seller_entity.dart';
import 'package:flowery/presentation/home/tabs/home/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/use_case/home_use_case/best_seller_use_case.dart';
@singleton
class HomeViewModel extends Cubit<HomeStates> {
  bestSellerUseCase BestSeller;

  HomeViewModel({required this.BestSeller}):super(Initial());

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

  dointent(HomeIntent home) {
    switch (home) {
      case BestSellerScreen():{

        BestSellerget();

      }
    }
  }

}

sealed class HomeIntent{
}

class BestSellerScreen extends HomeIntent {}