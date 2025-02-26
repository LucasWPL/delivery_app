import 'package:delivery_app/exports.dart';

class ItemDetailPage extends StatefulWidget {
  final Item item;

  const ItemDetailPage({super.key, required this.item});

  @override
  State<ItemDetailPage> createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  final CartController cartController = Get.find();
  final ItemController itemController = Get.find();

  int _quantity = 1;
  TextEditingController _observationController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (cartController.editing) {
      itemController.currentItem = cartController.editingItem!.item;
      itemController.selectedAddons = cartController.editingItem!.addons;
      _quantity = cartController.editingItem!.quantity;
      _observationController =
          TextEditingController(text: cartController.editingItem!.observation);
    } else {
      itemController.currentItem = widget.item;
      itemController.selectedAddons = [];
    }

    itemController.getDetails();
  }

  @override
  Widget build(BuildContext context) {
    double boxPercentage = MediaQuery.of(context).size.width > 600 ? 60 : 95;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: BrandColors.generalBackgroundColor,
        title: const Text(
          'Detalhes do produto',
          softWrap: true,
          maxLines: 2,
        ),
        surfaceTintColor: BrandColors.primaryColor,
      ),
      body: Center(
        child: SizedBox(
          width: ScreenHelper(context).widthPercentage(boxPercentage),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _imageAndInformativeMessage(),
                      _addons(),
                      _observations(),
                    ],
                  ),
                ),
              ),
              _bottomButtons(context),
            ],
          ),
        ),
      ),
    );
  }

  Obx _addons() {
    return Obx(() {
      if (itemController.isLoading.value) {
        return const LinearProgressIndicator(
            minHeight: 2, color: BrandColors.primaryColor);
      }

      return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: itemController.itemDetail.value.addons.length,
        itemBuilder: (context, index) {
          ItemAddon addon = itemController.itemDetail.value.addons[index];
          return DetailSectionWidget(title: addon.description, fields: [
            ...addon.details.map((detail) {
              return CheckboxListTile(
                title: Text("${detail.title} (${detail.price.toCurrency()})")
                    .w600s12,
                subtitle: Text(detail.description).w400s10,
                value: itemController.selectedAddons
                    .any((element) => element.id == detail.id),
                onChanged: (bool? isSelected) {
                  if (isSelected!) {
                    setState(() {
                      itemController.selectedAddons.add(detail);
                    });
                    return;
                  }

                  setState(() {
                    itemController.selectedAddons
                        .removeWhere((element) => element.id == detail.id);
                  });
                },
                activeColor: BrandColors.primaryColor,
              );
            })
          ]);
        },
      );
    });
  }

  Widget _observations() {
    return DetailSectionWidget(title: 'Observações', fields: [
      TextField(
        controller: _observationController,
        maxLines: 4,
        decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Ex.: remover ovo, alface, etc.',
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            )),
      )
    ]);
  }

  Widget _bottomButtons(context) {
    double boxPercentage = MediaQuery.of(context).size.width > 600 ? 60 : 100;

    return SizedBox(
      height: 50,
      width: ScreenHelper(context).widthPercentage(boxPercentage),
      child: Row(
        children: [
          Row(
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    if (_quantity > 1) {
                      _quantity--;
                    }
                  });
                },
                style: TextButton.styleFrom(
                  side: BorderSide.none,
                ),
                child: const Text('-',
                    style: TextStyle(color: BrandColors.primaryColor)),
              ),
              const SizedBox(width: 10),
              Text(_quantity.toString(),
                  style: const TextStyle(color: Colors.black)),
              const SizedBox(width: 10),
              TextButton(
                onPressed: () {
                  setState(() {
                    _quantity++;
                  });
                },
                style: TextButton.styleFrom(
                  side: BorderSide.none,
                ),
                child: const Text('+',
                    style: TextStyle(color: BrandColors.primaryColor)),
              ),
            ],
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                cartController.addItem(CartItem(
                  item: itemController.currentItem!,
                  quantity: _quantity,
                  addons: itemController.selectedAddons,
                  observation: _observationController.text,
                ));

                Get.toNamed(Routes.menu);
                ToastHelper.success(context, 'Produto adicionado ao carrinho');
              },
              style: TextButton.styleFrom(
                backgroundColor: BrandColors.primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
                minimumSize: const Size(0, 50),
              ),
              child: const Text(
                'Avançar',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _imageAndInformativeMessage() {
    bool isMobile = MediaQuery.of(context).size.width <= 600;

    var children = [
      Image.asset(
        widget.item.image,
        width: isMobile ? double.infinity : 200,
      ).paddingSymmetric(horizontal: 40, vertical: 20),
      Column(
        crossAxisAlignment:
            isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          Text(
            widget.item.title,
            softWrap: true,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Text(
            widget.item.price.toCurrency(),
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          Text(
            widget.item.description,
            softWrap: true,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ).paddingZero,
    ];

    return isMobile
        ? Column(children: children).paddingOnly(bottom: 20)
        : Row(children: children);
  }
}
