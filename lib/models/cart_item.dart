import 'package:delivery_app/exports.dart';

class CartItem {
  final Item item;
  final List<ItemAddonDetail> addons;

  int quantity;
  final String observation;

  CartItem(
      {required this.item,
      required this.quantity,
      required this.addons,
      required this.observation});

  double get totalValue {
    double total = item.price;
    for (var addon in addons) {
      total += addon.price;
    }

    return total * quantity;
  }

  String get addonsString {
    return addons
        .map((addon) => "‧ ${addon.description} (${addon.price.toCurrency()})")
        .join("\n");
  }
}
