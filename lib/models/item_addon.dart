import 'package:json_annotation/json_annotation.dart';

part 'item_addon.g.dart';

@JsonSerializable()
class ItemAddon {
  final String description;
  final List<ItemAddonDetail> details;

  ItemAddon({
    required this.description,
    required this.details,
  });

  factory ItemAddon.fromJson(Map<String, dynamic> json) =>
      _$ItemAddonFromJson(json);
  Map<String, dynamic> toJson() => _$ItemAddonToJson(this);
}

@JsonSerializable()
class ItemAddonDetail {
  final String id;
  final String title;
  final String description;
  final double price;

  ItemAddonDetail({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
  });

  factory ItemAddonDetail.fromJson(Map<String, dynamic> json) =>
      _$ItemAddonDetailFromJson(json);
  Map<String, dynamic> toJson() => _$ItemAddonDetailToJson(this);
}
