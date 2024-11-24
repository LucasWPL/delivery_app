import 'package:delivery_app/exports.dart';

class ItemController extends GetxController {
  final ItemRepository itemRepository;
  Rx<ItemDetail> itemDetail = ItemDetail(addons: []).obs;

  ItemController({required this.itemRepository});

  Future<void> getDetails() async {
    try {
      var response = await itemRepository.getDetails();
      itemDetail.value = ItemDetail.fromJson(response);
    } catch (e) {
      print(e);
    }
  }
}
