import 'package:json_annotation/json_annotation.dart';

part 'cart_request.g.dart';

@JsonSerializable()
class CartRequest {
  final String product;
  final int quantity;

  CartRequest({required this.product, required this.quantity});

  factory CartRequest.fromJson(Map<String, dynamic> json) =>
      _$CartRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CartRequestToJson(this);
}
