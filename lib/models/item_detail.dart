import 'package:delivery_app/exports.dart';

part 'item_detail.g.dart';

@JsonSerializable()
class ItemDetail {
  final List<ItemAddon> addons;

  ItemDetail({
    required this.addons,
  });

  factory ItemDetail.fromJson(Map<String, dynamic> json) =>
      _$ItemDetailFromJson(json);
  Map<String, dynamic> toJson() => _$ItemDetailToJson(this);
}
