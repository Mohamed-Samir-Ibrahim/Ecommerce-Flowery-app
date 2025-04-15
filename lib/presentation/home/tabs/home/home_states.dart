


import 'package:equatable/equatable.dart';
import 'package:flowery/data/model/home_model/categories/categories_model.dart';
import 'package:flowery/data/model/home_model/home_model.dart';
import 'package:flowery/data/model/home_model/occasions/occasions_model.dart';
import 'package:flowery/data/model/home_model/product/product_model.dart';
import 'package:flowery/data/model/home_model/product_by_occasion.dart';
import 'package:flowery/domain/entity/home_entity/category.dart';
enum Status { loading, success, error ,}

class HomeStates extends Equatable{
  Status status;
  HomeModel? home;
  ProductByOccasion? products;

  Exception? exception;
  String? loadingMessage;

  HomeStates(
      {required this.status,
        this.exception,
        this.products,
        this.loadingMessage,
        this.home
   });

  HomeStates copyWith({
    Status? status,
    Exception? exception,
    HomeModel? home,
    ProductByOccasion ?products,

    String? loadingMessage,
  }) {
    return HomeStates(
        status: status ?? this.status,
home: home??this.home,
        products: products??this.products,
        loadingMessage: loadingMessage ?? this.loadingMessage,
        exception: exception ?? this.exception);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status,exception,loadingMessage,home,products];

}

