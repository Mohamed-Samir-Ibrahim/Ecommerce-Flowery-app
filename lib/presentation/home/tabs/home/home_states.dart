import 'package:flowery/domain/entity/home_entity/best_seller_entity/best_seller_entity.dart';

abstract class HomeStates{
}

class Initial extends HomeStates{}

class IsLoadingBestSeller extends HomeStates{}
class SuccessBestSeller extends HomeStates{
  BestSellerEntity bestSellerEntity;
  SuccessBestSeller({required this.bestSellerEntity});
}
class ErrorBestSeller extends HomeStates{}