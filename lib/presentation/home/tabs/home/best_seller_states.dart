
import 'package:flowery/domain/entity/home_entity/best_seller_entity/best_seller_entity.dart';

abstract class BestSellerState{
}

class Initial extends BestSellerState{}

class IsLoadingBestSeller extends BestSellerState{}
class SuccessBestSeller extends BestSellerState{
  BestSellerEntity bestSellerEntity;
  SuccessBestSeller({required this.bestSellerEntity});
}
class ErrorBestSeller extends BestSellerState{}
