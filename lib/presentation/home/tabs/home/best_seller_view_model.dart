import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/common/api_result.dart';
import '../../../../domain/use_case/home_use_case/best_seller_use_case.dart';
import 'best_seller_states.dart';


@singleton
class BestSellerViewModel extends Cubit<BestSellerState> {
  BestSellerUseCase bestSellerUseCase;

    BestSellerViewModel({required this.bestSellerUseCase}):super(BestSellerState( status: BestSellerStatus.initial));

  void bestSellerGet()async{
    emit(state.copyWith(status: BestSellerStatus.loading));
    var response=await  bestSellerUseCase.get();
    switch(response){
      case Success():{
        var res =  response.data;
        emit(state.copyWith(status: BestSellerStatus.success,bestSellerEntity: res!));
      }
      case Error():{
        var e=response.exception;
          emit(state.copyWith(status: BestSellerStatus.error,exception: e));

      }

    }
  }

  doIntent(HomeIntent home) {
    switch (home) {
      case BestSellerScreen():{
        bestSellerGet();
      }
    }
  }

}

sealed class HomeIntent{
}

class BestSellerScreen extends HomeIntent {}
