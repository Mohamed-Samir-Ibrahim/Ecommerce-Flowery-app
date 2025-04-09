import 'package:flowery/domain/entity/home_entity/category.dart';
import 'package:json_annotation/json_annotation.dart';
part 'categories_model.g.dart';

@JsonSerializable()
class CategoriesModel {
  String ?id;
  String ?name;
  String ?slug;
  String ?image;

  CategoriesModel({this.id, this.name, this.slug, this.image,});

  factory CategoriesModel.fromJson(Map<String, dynamic> json) => _$CategoriesModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesModelToJson(this);
  Category toCategory(){
    return Category(
        id: id,
        name: name,
        slug: slug,
        image: image,
    );
  }
}