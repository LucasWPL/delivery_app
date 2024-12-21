import 'package:delivery_app/exports.dart';

class CartController extends GetxController {
  CartController();

  bool editing = false;
  CartItem? editingItem;

  var items = <CartItem>[].obs;

  void addItem(CartItem item) {
    items.add(item);

    editing = false;
    editingItem = null;
  }

  void editItem(CartItem item) {
    editing = true;
    editingItem = item;

    removeItem(item);
  }

  void removeItem(CartItem item) {
    items.removeWhere((cartItem) => cartItem == item);
  }

  double get totalValue {
    return items.fold(0, (total, element) => total + element.totalValue);
  }
}
