import 'package:delivery_app/exports.dart';

class Routes {
  static const menu = '/menu';
  static const cart = '/cart';
  static const itemDetail = '/item/detail';

  static List<GetPage> dependencies = [
    GetPage(name: Routes.menu, page: () => const MenuPage()),
    GetPage(name: Routes.cart, page: () => const CartPage()),
    GetPage(
      name: Routes.itemDetail,
      page: () => ItemDetailPage(item: Get.arguments),
    ),
  ];
}
