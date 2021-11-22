import 'package:igricultor_app/data/models/category.dart';
import 'package:json_annotation/json_annotation.dart';

part 'show_case.g.dart';

@JsonSerializable()
class ShowCase {
  List<Category> categories;

  ShowCase({
    required this.categories,
  });

  factory ShowCase.fromJson(Map<String, dynamic> json) =>
      _$ShowCaseFromJson(json);
}
