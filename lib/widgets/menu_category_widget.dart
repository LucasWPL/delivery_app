import 'package:delivery_app/exports.dart';

class MenuCategoryWidget extends StatelessWidget {
  final List<MenuItem> items;

  const MenuCategoryWidget({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = constraints.maxWidth > 600 ? 2 : 1;

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            childAspectRatio: 6,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Container(
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
                  informativeItemText(items[index]),
                  const Spacer(),
                  Image.asset(items[index].image)
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget informativeItemText(MenuItem item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.title.toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(item.description),
        Text(
          item.price.toCurrency(),
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
