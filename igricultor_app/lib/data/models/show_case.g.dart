// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_case.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowCase _$ShowCaseFromJson(Map<String, dynamic> json) => ShowCase(
      categories: (json['categories'] as List<dynamic>)
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ShowCaseToJson(ShowCase instance) => <String, dynamic>{
      'categories': instance.categories,
    };
