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
    if (cartController.items.isNotEmpty) {
      bool isMobile = MediaQuery.of(context).size.width <= 600;

      return Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal:
                  ScreenHelper(context).widthPercentage(isMobile ? 5 : 10),
              vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                    CartItem cartItem = cartController.items[index];

                    return Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              cartItem.item.image,
                              width: 80,
                            ).paddingAll(20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(cartItem.item.title).w400s14,
                                Text(cartItem.addonsString)
                                    .w400s10
                                    .paddingOnly(left: 5),
                                if (cartItem.observation.isNotEmpty)
                                  Text('Observação: ${cartItem.observation}')
                                      .w400s10
                                      .paddingOnly(top: 10),
                              ],
                            ),
                            const Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Quantidade: ${cartItem.quantity}"),
                                Text(
                                    "Subtotal: ${cartItem.totalValue.toCurrency()}"),
                              ],
                            ).paddingOnly(right: 10),
                          ],
                        ),
                        SizedBox(
                            height: 1,
                            child: Container(color: Colors.grey.shade300)),
                      ],
                    );
                  },
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text('Total: ${cartController.totalValue.toCurrency()}')
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
  }

  Row subAppBar() {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.green,
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
          Image.asset('icons/empty_cart.png', width: 200).paddingOnly(top: 150),
          const SizedBox(height: 10),
          const Text('Seu carrinho está vazio :('),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () => Get.off(const HomePage()),
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
