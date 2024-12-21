import 'package:delivery_app/exports.dart';

class CartItemWidget extends StatefulWidget {
  const CartItemWidget({
    super.key,
    required this.cartItem,
  });

  final CartItem cartItem;

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              widget.cartItem.item.image,
              width: 80,
            ).paddingAll(20),
            if (!ScreenHelper.isMobile(context)) ..._desktopWidgets(context),
            if (ScreenHelper.isMobile(context)) _mobileWidget(context),
          ],
        ).paddingOnly(top: 10),
        SizedBox(height: 1, child: Container(color: Colors.grey.shade300)),
      ],
    );
  }

  List<Widget> _desktopWidgets(context) {
    return [
      _itemInfo(context),
      const Spacer(),
      SizedBox(
        width: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.only(right: 20), child: _itemValue()),
            _actionButtons()
          ],
        ),
      ),
    ];
  }

  Column _mobileWidget(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _itemInfo(context),
        const SizedBox(height: 10),
        _itemValue(),
        _actionButtons(),
      ],
    );
  }

  _actionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextButton(
          onPressed: () => _removeItemModal(),
          style: TextButton.styleFrom(
            padding: const EdgeInsets.only(right: 10, top: 15),
          ),
          child: const Text('Remover').brandPrimary,
        ),
        TextButton(
          onPressed: () {
            cartController.editItem(widget.cartItem);
            Get.to(() => ItemDetailPage(item: widget.cartItem.item));
          },
          style: TextButton.styleFrom(
            padding: const EdgeInsets.only(left: 10, top: 15),
          ),
          child: const Text('Editar').brandPrimary,
        ),
      ],
    );
  }

  _itemValue() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            children: [
              const TextSpan(
                text: "Quantidade: ",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              ),
              // WidgetSpan(
              //   child: GestureDetector(
              //     onTap: () {
              //       setState(() {
              //         if (widget.cartItem.quantity == 1) {
              //           _removeItemModal();
              //           return;
              //         }

              //         widget.cartItem.quantity--;
              //       });
              //     },
              //     child: Icon(
              //       widget.cartItem.quantity == 1 ? Icons.delete : Icons.remove,
              //       size: 18,
              //       color: NeutralColors.firebrick,
              //     ),
              //   ),
              // ),
              TextSpan(
                text: widget.cartItem.quantity.toString(),
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              // WidgetSpan(
              //   child: GestureDetector(
              //     onTap: () {
              //       setState(() {
              //         widget.cartItem.quantity++;
              //       });
              //     },
              //     child: const Icon(
              //       Icons.add,
              //       size: 20,
              //       color: BrandColors.primaryColor,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
        Text("Subtotal: ${widget.cartItem.totalValue.toCurrency()}").w400s12,
      ],
    );
  }

  Future<dynamic> _removeItemModal() {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Center(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('icons/remove_cart_item.png', width: 200),
                const SizedBox(height: 20),
                const Text('Remover item do carrinho?').w600s18,
                const SizedBox(height: 20),
                Text(
                  'Você tem certeza que deseja remover ${widget.cartItem.item.title} do carrinho?',
                  textAlign: TextAlign.center,
                ).w400s14,
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FullSizeButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      description: 'Cancelar',
                    ),
                    const SizedBox(width: 10),
                    FullSizeButton(
                      onPressed: () {
                        cartController.removeItem(widget.cartItem);
                        Navigator.pop(context);
                      },
                      description: 'Remover',
                      buttonType: ButtonType.secondary,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _itemInfo(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.cartItem.item.title).w400s14,
        if (widget.cartItem.addonsString.isNotEmpty)
          Text(widget.cartItem.addonsString).w400s10.paddingOnly(left: 5),
        if (widget.cartItem.observation.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  maxWidth: ScreenHelper(context).widthPercentage(60)),
              child: Text(
                'Observação: ${widget.cartItem.observation}',
                softWrap: true,
                overflow: TextOverflow.visible,
              ).w400s10,
            ),
          ),
      ],
    );
  }
}
