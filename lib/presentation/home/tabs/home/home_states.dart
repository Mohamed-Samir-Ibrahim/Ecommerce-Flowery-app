
import 'package:flowery/data/model/home_model/product_model/product_response_dto.dart';
import 'package:flowery/domain/entity/home_entity/best_seller_entity/best_seller_entity.dart';
import 'package:flowery/domain/entity/home_entity/product_response_entity/product_response_entity.dart';

abstract class HomeStates{
}

class Initial extends HomeStates{}

class IsLoadingBestSeller extends HomeStates{}
class SuccessBestSeller extends HomeStates{
  BestSellerEntity bestSellerEntity;
  SuccessBestSeller({required this.bestSellerEntity});
}
class ErrorBestSeller extends HomeStates{}

class IsLoadingProduct extends HomeStates{}
class SuccessProduct extends HomeStates{
  ProductResponseDto productResponseDto;
  SuccessProduct({required this.productResponseDto});
}
class ErrorProduct extends HomeStates{}


import 'package:equatable/equatable.dart';
import 'package:flowery/data/model/home_model/categories/categories_model.dart';
import 'package:flowery/data/model/home_model/home_model.dart';
import 'package:flowery/domain/entity/home_entity/category.dart';
enum Status { loading, success, error ,}

class HomeStates extends Equatable{
  Status status;
  HomeModel? home;

  Exception? exception;
  String? loadingMessage;

  HomeStates(
      {required this.status,
        this.exception,
        this.loadingMessage,
        this.home
   });

  HomeStates copyWith({
    Status? status,
    Exception? exception,
    HomeModel? home,

    String? loadingMessage,
  }) {
    return HomeStates(
        status: status ?? this.status,
home: home??this.home,
        loadingMessage: loadingMessage ?? this.loadingMessage,
        exception: exception ?? this.exception);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status,exception,loadingMessage,home];

}

