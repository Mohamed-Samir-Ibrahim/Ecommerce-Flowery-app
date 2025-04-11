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