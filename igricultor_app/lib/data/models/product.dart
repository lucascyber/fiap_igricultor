import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  final int id;
  final String name;
  final String price;
  final String weight;
  @JsonKey(name: 'nota')
  final int rating;
  @JsonKey(name: 'frete')
  final String shipping;
  @JsonKey(name: 'safra')
  final String harvest;
  final String type;
  final String image;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.weight,
    required this.rating,
    required this.shipping,
    required this.harvest,
    required this.type,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
