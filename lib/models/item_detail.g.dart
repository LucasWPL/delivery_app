// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemDetail _$ItemDetailFromJson(Map<String, dynamic> json) => ItemDetail(
      addons: (json['addons'] as List<dynamic>)
          .map((e) => ItemAddon.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ItemDetailToJson(ItemDetail instance) =>
    <String, dynamic>{
      'addons': instance.addons,
    };
