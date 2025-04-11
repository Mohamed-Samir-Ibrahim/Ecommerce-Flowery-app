import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/common/api_result.dart';
import '../../../../domain/use_case/home_use_case/best_seller_use_case.dart';
import 'best_seller_states.dart';
import 'home_states.dart';

@singleton
class BestSellerViewModel extends Cubit<BestSellerState> {
  bestSellerUseCase BestSeller;

    BestSellerViewModel({required this.BestSeller}):super(Initial());

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
