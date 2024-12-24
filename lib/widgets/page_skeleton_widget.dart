import 'package:delivery_app/exports.dart';

class PageSkeletonWidget extends StatelessWidget {
  final Widget child;
  final String routeName;

  PageSkeletonWidget({super.key, required this.child, required this.routeName});

  final List bottomNavigationItems = [
    {'icon': Icons.menu, 'label': 'Cardápio', 'route': Routes.menu},
    {'icon': Icons.shopping_cart, 'label': 'Carrinho', 'route': Routes.cart},
  ];

  @override
  Widget build(BuildContext context) {
    int currentIndex = _resolveIndex(routeName);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: BrandColors.primaryColor,
        automaticallyImplyLeading: false,
        title: Padding(
          padding:
              EdgeInsets.only(left: ScreenHelper(context).widthPercentage(9)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const FirebaseCircularImage(fileName: 'images/logo.webp'),
              const SizedBox(width: 10),
              const Text(
                'Lá em casa delivery',
                style: TextStyle(color: Colors.white),
              ).w600s18,
            ],
          ),
        ),
      ),
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: BrandColors.generalBackgroundColor,
        selectedItemColor: BrandColors.primaryColor,
        unselectedItemColor: BrandColors.primaryColor,
        currentIndex: currentIndex,
        onTap: (index) {
          currentIndex = index;
          Get.toNamed(bottomNavigationItems[index]['route']);
        },
        items: bottomNavigationItems.map((item) {
          return BottomNavigationBarItem(
            icon: Icon(item['icon']),
            label: item['label'],
          );
        }).toList(),
      ),
    );
  }

  int _resolveIndex(String routeName) {
    int index = 0;
    for (var item in bottomNavigationItems) {
      if (item['route'] == routeName) {
        return index;
      }
      index++;
    }

    return 0;
  }
}
