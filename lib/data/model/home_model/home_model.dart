import 'package:flowery/data/model/home_model/best_seller/best_seller_model.dart';
import 'package:flowery/data/model/home_model/categories/categories_model.dart';
import 'package:flowery/data/model/home_model/occasions/occasions_model.dart';
import 'package:flowery/data/model/home_model/product/product_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_model.g.dart';

@JsonSerializable()
class HomeModel {
  String ?message;
  List<ProductModel>? products;
  List<CategoriesModel>? categories;
  List<BestSellerModel>? bestSeller;
  List<OccasionsModel> ?occasions;

  HomeModel({this.message, this.products, this.categories, this.bestSeller, this.occasions});

  factory HomeModel.fromJson(Map<String, dynamic> json) => _$HomeModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeModelToJson(this);
}







