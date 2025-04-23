

// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flowery/data/model/home_model/home_model.dart';
import 'package:flowery/data/model/home_model/product_by_occasion.dart';
import 'package:flowery/domain/entity/Categotries_entity/category_model.dart';

enum CategoryStatus { initial,loading, success, error ,}

class CategoryStates extends Equatable{
  CategoryStatus status;
  String? searchQuery;
  List<ProductsBean>? filteredProducts;
  List<Categories_entity>? Obj_categories;
  Exception? exception;
  ProductByOccasion? products;
  HomeModel? home;


  String? loadingMessage;

  CategoryStates(
      {required this.status,
        this.exception,
        this.home,
        this.products,
        this.loadingMessage,
        this.Obj_categories,
        this.searchQuery,
        this.filteredProducts,});

  CategoryStates copyWith({
    CategoryStatus? status,
    List<Categories_entity>? Obj_categories,
    List<ProductsBean>? filteredProducts,
    String? searchQuery,
    Exception? exception,
    HomeModel? home,
    ProductByOccasion? products,
    String? loadingMessage,
  }) {
    return CategoryStates(
        status: status ?? this.status,
        loadingMessage: loadingMessage ?? this.loadingMessage,
        exception: exception ?? this.exception,
        products: products??this.products,
        searchQuery: searchQuery??this.searchQuery,
        filteredProducts: filteredProducts??this.filteredProducts,
        home: home??this.home,
        Obj_categories:Obj_categories?? this.Obj_categories ,);
  }

  @override
  List<Object?> get props => [status,Obj_categories,home,exception,loadingMessage,products,searchQuery,filteredProducts];
}
