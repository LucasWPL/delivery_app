import 'package:delivery_app/exports.dart';

class ItemDetailPage extends StatefulWidget {
  final Item item;

  const ItemDetailPage({required this.item});

  @override
  State<ItemDetailPage> createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  final ItemController itemController = Get.find();
  int _quantity = 1;

  @override
  void initState() {
    super.initState();

    itemController.currentItem = widget.item;
    itemController.getDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do produto'),
        surfaceTintColor: Colors.green,
      ),
      body: Center(
        child: SizedBox(
          width: ScreenHelper(context).widthPercentage(60),
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
        return const LinearProgressIndicator(minHeight: 2, color: Colors.green);
      }

      return ListView.builder(
        shrinkWrap: true,
        itemCount: itemController.itemDetail.value.addons.length,
        itemBuilder: (context, index) {
          ItemAddon addon = itemController.itemDetail.value.addons[index];
          return DetailSectionWidget(title: addon.description, fields: [
            ...addon.details.map((detail) {
              return CheckboxListTile(
                title: Text(detail.title).w500s12,
                subtitle:
                    Text("${detail.description} (${detail.price.toCurrency()})")
                        .w400s10,
                value: itemController.selectedAddons
                    .any((element) => element.internalId == detail.internalId),
                onChanged: (bool? isSelected) {
                  if (isSelected!) {
                    setState(() {
                      itemController.selectedAddons.add(detail);
                    });
                    return;
                  }

                  setState(() {
                    itemController.selectedAddons.removeWhere(
                        (element) => element.internalId == detail.internalId);
                  });
                },
              );
            })
          ]);
        },
      );
    });
  }

  Widget _observations() {
    return const DetailSectionWidget(title: 'Observações', fields: [
      TextField(
        maxLines: 4,
        decoration: InputDecoration(
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
    return SizedBox(
      height: 50,
      width: ScreenHelper(context).widthPercentage(60),
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
                child: const Text('-', style: TextStyle(color: Colors.green)),
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
                child: const Text('+', style: TextStyle(color: Colors.green)),
              ),
            ],
          ),
          Expanded(
            child: TextButton(
              onPressed: () => {},
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
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
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            width: 200,
            widget.item.image,
            fit: BoxFit.cover,
          ),
        ).paddingAll(40),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.item.title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              widget.item.price.toCurrency(),
              softWrap: true,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            Text(
              widget.item.description,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ).marginOnly(top: 10),
          ],
        ),
      ],
    );
  }
}
