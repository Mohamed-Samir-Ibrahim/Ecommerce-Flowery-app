import 'package:json_annotation/json_annotation.dart';
part 'occasions_model.g.dart';

@JsonSerializable()
class OccasionsModel {
  String ?id;
  String ?name;
  String ?slug;
  String ?image;

  OccasionsModel({this.id, this.name, this.slug, this.image,});

  factory OccasionsModel.fromJson(Map<String, dynamic> json) => _$OccasionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$OccasionsModelToJson(this);
}