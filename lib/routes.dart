import 'package:delivery_app/exports.dart';

class Routes {
  static const menu = '/menu';
  static const cart = '/cart';
  static const itemDetail = '/item/detail';

  static List<GetPage> dependencies = [
    GetPage(
      name: Routes.menu,
      page: () => const MenuPage(),
      transition: Transition.topLevel,
      transitionDuration: const Duration(milliseconds: 100),
    ),
    GetPage(
      name: Routes.cart,
      page: () => const CartPage(),
      transition: Transition.topLevel,
      transitionDuration: const Duration(milliseconds: 100),
    ),
    GetPage(
      name: Routes.itemDetail,
      page: () => ItemDetailPage(item: Get.arguments),
      transition: Transition.zoom,
      transitionDuration: const Duration(milliseconds: 200),
    ),
  ];
}
