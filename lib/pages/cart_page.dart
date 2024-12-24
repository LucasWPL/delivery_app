import 'package:delivery_app/exports.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return PageSkeletonWidget(
      routeName: Routes.cart,
      child: Obx(() {
        if (cartController.items.isNotEmpty) {
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenHelper(context)
                      .widthPercentage(ScreenHelper.isMobile(context) ? 5 : 10),
                  vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Image.asset('brand/logo.png', width: 100),
                  ).paddingOnly(bottom: 15),
                  subAppBar(),
                  SizedBox(
                    height: 1,
                    child: Container(color: BrandColors.primaryColor),
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: cartController.items.length,
                      itemBuilder: (context, index) {
                        return CartItemWidget(
                            cartItem: cartController.items[index]);
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child:
                        Text('Total: ${cartController.totalValue.toCurrency()}')
                            .w500s18,
                  ).paddingSymmetric(vertical: 10),
                  TextButton(
                    onPressed: () => (),
                    style: TextButton.styleFrom(
                      backgroundColor: BrandColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: const Text(
                      'Finalizar pedido',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          );
        }

        return emptyCart();
      }),
    );
  }

  Row subAppBar() {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: BrandColors.primaryColor,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Text(
              'Quase lá!',
              style: TextStyle(color: Colors.white),
            ).w500s16,
          ),
        ),
        const Text('Seus itens:').w500s16.paddingOnly(left: 10),
      ],
    );
  }

  Center emptyCart() {
    return Center(
      child: Column(
        children: [
          Image.asset('icons/empty_cart.png', width: 200).paddingOnly(top: 200),
          const SizedBox(height: 10),
          const Text('Seu carrinho está vazio :('),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () => Get.toNamed(Routes.menu),
            style: TextButton.styleFrom(
              backgroundColor: BrandColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              minimumSize: const Size(250, 50),
            ),
            child: const Text(
              '← Voltar ao cardápio',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
