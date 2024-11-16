import 'package:delivery_app/exports.dart';

class GeneralBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Dio());

    Get.put(CategoryRepository(dio: Get.find()));

    Get.put(CategoryController(categoryRepository: Get.find()));
  }
}
