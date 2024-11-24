import 'package:delivery_app/exports.dart';

part 'category.g.dart';

@JsonSerializable()
class Category {
  final String name;
  final List<Item> items;

  Category({required this.name, required this.items});

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
