import 'package:delivery_app/exports.dart';

class CartController extends GetxController {
  CartController();

  var items = <CartItem>[].obs;

  void addItem(CartItem item) {
    items.add(item);
  }

  double get totalValue {
    return items.fold(0, (total, element) => total + element.totalValue);
  }
}
