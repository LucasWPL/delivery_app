import 'package:delivery_app/exports.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const MenuPage(),
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
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
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: BrandColors.generalBackgroundColor,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: BrandColors.primaryColor,
        unselectedItemColor: BrandColors.primaryColor,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Cardápio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Carrinho',
          ),
        ],
      ),
    );
  }
}
