import 'package:delivery_app/exports.dart';

class CategoryController extends GetxController {
  final CategoryRepository categoryRepository;
  CategoryController({required this.categoryRepository});

  var categories = <Category>[].obs;
  var isLoading = false.obs;

  Future<void> fetchCategories() async {
    isLoading.value = true;

    try {
      var fetchedCategories = await categoryRepository.fetchCategories();
      categories.value = fetchedCategories;
    } catch (e) {
      // print('Erro ao carregar categorias: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
