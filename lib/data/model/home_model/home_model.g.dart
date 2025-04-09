// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeModel _$HomeModelFromJson(Map<String, dynamic> json) => HomeModel(
  message: json['message'] as String?,
  products:
      (json['products'] as List<dynamic>?)
          ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  categories:
      (json['categories'] as List<dynamic>?)
          ?.map((e) => CategoriesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  bestSeller:
      (json['bestSeller'] as List<dynamic>?)
          ?.map((e) => BestSellerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  occasions:
      (json['occasions'] as List<dynamic>?)
          ?.map((e) => OccasionsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$HomeModelToJson(HomeModel instance) => <String, dynamic>{
  'message': instance.message,
  'products': instance.products,
  'categories': instance.categories,
  'bestSeller': instance.bestSeller,
  'occasions': instance.occasions,
};
