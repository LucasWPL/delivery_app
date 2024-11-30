import 'package:delivery_app/exports.dart';

class MenuCategoryWidget extends StatelessWidget {
  final List<Item> items;

  const MenuCategoryWidget({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = constraints.maxWidth > 600 ? 2 : 1;
        double childAspectRatio = constraints.maxWidth > 600 ? 6 : 3.5;

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            childAspectRatio: childAspectRatio,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () async =>
                    Get.to(() => ItemDetailPage(item: items[index])),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 0.2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 2,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: FirebaseGeneralImageWidget(
                          fileName: items[index].image,
                          height: 110,
                        ),
                      ),
                      const SizedBox(width: 16),
                      informativeItemText(items[index]),
                    ],
                  ),
                ));
          },
        );
      },
    );
  }

  Widget informativeItemText(Item item) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.title.toUpperCase(),
            softWrap: true,
            maxLines: 2,
          ).w500s14,
          Text(
            item.description,
            softWrap: true,
            maxLines: 2,
          ).w400s12,
          Text(item.price.toCurrency()).w600s14,
        ],
      ),
    );
  }
}
