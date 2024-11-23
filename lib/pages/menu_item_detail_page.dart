import 'package:delivery_app/exports.dart';

class MenuItemDetailPage extends StatefulWidget {
  final MenuItem item;

  const MenuItemDetailPage({required this.item});

  @override
  State<MenuItemDetailPage> createState() => _MenuItemDetailPageState();
}

class _MenuItemDetailPageState extends State<MenuItemDetailPage> {
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do produto'),
        shadowColor: Colors.grey,
        elevation: 1,
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
              Text(_quantity.toString(), style: TextStyle(color: Colors.black)),
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

  Widget _observations() {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 45,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: const BorderRadius.all(Radius.circular(4)),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: const Text('Observações',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold))
                  .paddingOnly(left: 10),
            ),
          ),
        ),
        const TextField(
          maxLines: 4,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Ex.: remover ovo, alface, etc.',
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              )),
        ).paddingOnly(top: 10),
      ],
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
