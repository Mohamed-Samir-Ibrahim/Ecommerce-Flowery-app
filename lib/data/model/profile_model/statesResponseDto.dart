import 'package:flowery/domain/entity/profile_entity/statesentity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'statesResponseDto.g.dart';

@JsonSerializable()
class StatesResponseDto extends statesentity {
  StatesResponseDto({
    required super.id,
    required super.governorate_id,
    required super.city_name_ar,
    required super.city_name_en,
  });

  factory StatesResponseDto.fromJson(Map<String, dynamic> json) {
    return StatesResponseDto(
      id: json['id'] is int ? json['id'] : int.tryParse(json['id']?.toString() ?? '0') ?? 0,
      governorate_id: json['governorate_id'] is int
          ? json['governorate_id']
          : int.tryParse(json['governorate_id']?.toString() ?? '0') ?? 0,
      city_name_ar: json['city_name_ar'] as String,
      city_name_en: json['city_name_en'] as String,
    );
  }
}
