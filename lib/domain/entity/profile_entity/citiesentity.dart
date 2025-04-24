import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
class Citiesentity  {
  final int id;
  final String nameAr;
  final String nameEn;

  Citiesentity({required this.id, required this.nameAr, required this.nameEn});

Citiesentity CopyWith({int? id, String? nameAr, String? nameEn}) => Citiesentity(id: id ?? this.id, nameAr: nameAr ?? this.nameAr, nameEn: nameEn ?? this.nameEn);
}

