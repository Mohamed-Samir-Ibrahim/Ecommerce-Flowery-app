
import 'package:equatable/equatable.dart';
import 'package:flowery/domain/entity/home_entity/best_seller_entity/best_seller_entity.dart';

enum BestSellerStatus{initial,loading,success,error}

class BestSellerState extends Equatable{
  BestSellerStatus? status;
  BestSellerEntity? bestSellerEntity;

  Exception? exception;
  BestSellerState({required this.status,
    this.bestSellerEntity
    ,this.exception});
  BestSellerState copyWith({
    BestSellerStatus? status,
    BestSellerEntity? bestSellerEntity,
    Exception? exception,
  }) {
    return BestSellerState(
      bestSellerEntity: bestSellerEntity ?? this.bestSellerEntity,
      status: status ?? this.status,
      exception: exception ?? this.exception,
    );
  }
  @override
  List<Object?> get props => [status,exception,bestSellerEntity];
}
