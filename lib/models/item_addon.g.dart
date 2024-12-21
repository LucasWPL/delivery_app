// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_addon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemAddon _$ItemAddonFromJson(Map<String, dynamic> json) => ItemAddon(
      description: json['description'] as String,
      details: (json['details'] as List<dynamic>)
          .map((e) => ItemAddonDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ItemAddonToJson(ItemAddon instance) => <String, dynamic>{
      'description': instance.description,
      'details': instance.details,
    };

ItemAddonDetail _$ItemAddonDetailFromJson(Map<String, dynamic> json) =>
    ItemAddonDetail(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$ItemAddonDetailToJson(ItemAddonDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
    };
