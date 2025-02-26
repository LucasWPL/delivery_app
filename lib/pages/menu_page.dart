import 'package:delivery_app/exports.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final CategoryController categoryController = Get.find();

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width <= 600;

    if (categoryController.categories.isEmpty) {
      categoryController.fetchCategories();
    }

    return PageSkeletonWidget(
      routeName: Routes.menu,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
            left: ScreenHelper(context).widthPercentage(isMobile ? 5 : 10),
            right: ScreenHelper(context).widthPercentage(isMobile ? 5 : 10),
            top: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Image.asset('brand/logo.png', width: 100),
              ).paddingOnly(bottom: 15),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: BrandColors.primaryColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text(
                        'Loja aberta',
                        style: TextStyle(color: Colors.white),
                      ).w500s16,
                    ),
                  ),
                  const Icon(Icons.access_time_outlined)
                      .paddingOnly(left: 10, right: 5),
                  const Text('Das 09:00 às 18:00').w500s14,
                ],
              ),
              SizedBox(
                      height: 1,
                      child: Container(color: BrandColors.primaryColor))
                  .paddingOnly(bottom: 5),
              Expanded(
                child: Obx(() {
                  if (categoryController.isLoading.value) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: BrandColors.primaryColor,
                      ),
                    );
                  }

                  return CustomScrollView(
                    slivers: [
                      // SliverToBoxAdapter(
                      //   child: SizedBox(
                      //     width: double.infinity,
                      //     child: AspectRatio(
                      //       aspectRatio: isMobile ? (16 / 9) : (16 / 3),
                      //       child: Image.asset(
                      //         'banners/banner.webp',
                      //         fit: BoxFit.cover,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            final category =
                                categoryController.categories[index];
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  category.name,
                                  style: const TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ).paddingOnly(top: 20),
                                MenuCategoryWidget(items: category.items)
                                    .paddingOnly(top: 8),
                              ],
                            ).paddingOnly(bottom: 15);
                          },
                          childCount: categoryController.categories.length,
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
