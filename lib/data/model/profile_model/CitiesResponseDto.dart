import 'package:flowery/domain/entity/profile_entity/citiesentity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'CitiesResponseDto.g.dart';
@JsonSerializable()
class CitiesResponseDto  extends Citiesentity {
  CitiesResponseDto({
    required super.id, required super.nameAr, required super.nameEn});

  factory CitiesResponseDto.fromJson(Map<String, dynamic> json) {
    return CitiesResponseDto(
      id: json['id'] is int
          ? json['id'] as int
          : int.tryParse(json['id']?.toString() ?? '0') ?? 0,      nameAr: json['governorate_name_ar'] as String,
      nameEn: json['governorate_name_en'] as String,
    );
  }

}