
import 'package:flowery/domain/common/api_result.dart';

import 'package:flowery/domain/use_case/home_use_case/home_use_case.dart';

import 'package:flowery/presentation/home/tabs/home/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';


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

