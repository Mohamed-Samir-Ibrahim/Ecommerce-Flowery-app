import 'package:json_annotation/json_annotation.dart';
class statesentity {
  final int id;
  final int governorate_id;
  final String city_name_ar;
  final String city_name_en;
  statesentity({required this.id,required this.governorate_id,required this.city_name_ar,required this.city_name_en});
  statesentity CopyWith({int? id,int? governorate_id,String? city_name_ar,String? city_name_en}){
    return statesentity(id: id??this.id  ,governorate_id: governorate_id??this.governorate_id,city_name_ar: city_name_ar??this.city_name_ar,city_name_en: city_name_en??this.city_name_en);
  }
}