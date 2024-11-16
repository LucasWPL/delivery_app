import 'package:json_annotation/json_annotation.dart';

part 'menu_item.g.dart';

@JsonSerializable()
class MenuItem {
  final String title;
  final String description;
  final double price;
  final String image;

  MenuItem({
    required this.title,
    required this.description,
    required this.price,
    required this.image,
  });
  
  factory MenuItem.fromJson(Map<String, dynamic> json) => _$MenuItemFromJson(json);
  Map<String, dynamic> toJson() => _$MenuItemToJson(this);
}