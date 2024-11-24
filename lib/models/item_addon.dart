import 'dart:math';

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

  factory ItemAddon.fromJson(Map<String, dynamic> json) => _$ItemAddonFromJson(json);
  Map<String, dynamic> toJson() => _$ItemAddonToJson(this);
}

@JsonSerializable()
class ItemAddonDetail {
  final String internalId;
  final String title;
  final String description;
  final double price;

  ItemAddonDetail({
    required this.internalId,
    required this.title,
    required this.description,
    required this.price,
  });

  factory ItemAddonDetail.fromJson(Map<String, dynamic> json) {
    final random = Random();
    final internalId = 'addon_${random.nextInt(10000)}';

    return ItemAddonDetail(
      internalId: internalId,
      title: json['title'],
      description: json['description'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() => _$ItemAddonDetailToJson(this);
}