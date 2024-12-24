import 'package:delivery_app/exports.dart';

class PageSkeletonWidget extends StatelessWidget {
  final Widget child;
  final String routeName;

  PageSkeletonWidget({super.key, required this.child, required this.routeName});

  final List bottomNavigationItems = [
    {'icon': Icons.home_filled, 'label': 'Cardápio', 'route': Routes.menu},
    {
      'icon': Icons.shopping_bag_outlined,
      'label': 'Carrinho',
      'route': Routes.cart
    },
    {'icon': Icons.person_3_sharp, 'label': 'Perfil', 'route': Routes.cart},
    {'icon': Icons.chat_outlined, 'label': 'Perfil', 'route': Routes.cart},
  ];

  @override
  Widget build(BuildContext context) {
    int currentIndex = _resolveIndex(routeName);

    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   automaticallyImplyLeading: false,
      //   title: Padding(
      //     padding: EdgeInsets.symmetric(
      //         horizontal: ScreenHelper(context)
      //             .widthPercentage(ScreenHelper.isMobile(context) ? 0 : 9),
      //         vertical: 20),
      //     child: Align(
      //       alignment: Alignment.topLeft,
      //       child: Image.asset('brand/logo.png', width: 100),
      //     ),
      //   ),
      // ),
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: BrandColors.generalBackgroundColor,
        selectedItemColor: BrandColors.primaryColor,
        unselectedItemColor: BrandColors.primaryColor,
        currentIndex: currentIndex,
        showSelectedLabels: false, // Oculta todas as labels
        showUnselectedLabels: false, // Oculta todas as labels
        selectedFontSize: 8,
        unselectedFontSize: 0,
        iconSize: 26,
        onTap: (index) {
          Get.toNamed(bottomNavigationItems[index]['route']);
        },
        items: bottomNavigationItems.map((item) {
          final isSelected =
              bottomNavigationItems.indexOf(item) == currentIndex;

          return BottomNavigationBarItem(
            icon: isSelected
                ? Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: BrandColors.primaryColor, // Fundo do círculo
                    ),
                    child: SizedBox(
                      width: 50, // Tamanho fixo do círculo
                      height: 50,
                      child: Icon(
                        item['icon'],
                        color: BrandColors
                            .generalBackgroundColor, // Cor do ícone selecionado
                      ),
                    ),
                  )
                : Icon(
                    item['icon'],
                    color: BrandColors
                        .primaryColor, // Cor do ícone não selecionado
                  ),
            label: 'Test', // Não exibe labels
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
