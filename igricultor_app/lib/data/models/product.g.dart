// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as int,
      name: json['name'] as String,
      price: json['price'] as String,
      weight: json['weight'] as String,
      rating: json['nota'] as int,
      shipping: json['frete'] as String,
      type: json['type'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'weight': instance.weight,
      'nota': instance.rating,
      'frete': instance.shipping,
      'type': instance.type,
      'image': instance.image,
    };
