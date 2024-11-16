import 'package:delivery_app/exports.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Category> categories = [
      Category(
        name: 'Pizzas',
        items: [
          MenuItem(
            title: 'Pizza média (6 pedaços)',
            description: 'Pizza com até 2 sabores e 6 fatias',
            price: 40,
            image: 'images/pizza.jpg',
          ),
          MenuItem(
            title: 'Pizza pequena (4 pedaços)',
            description: 'Pizza 1 sabor e 4 fatias',
            price: 30,
            image: 'images/pizza.jpg',
          ),
          MenuItem(
            title: 'Pizza grande (8 pedaços)',
            description: 'Pizza com até 2 sabores e 8 fatias',
            price: 45,
            image: 'images/pizza.jpg',
          ),
        ],
      ),
      Category(
        name: 'Massas',
        items: [
          MenuItem(
            title: 'Espaguete à bolonhesa',
            description: 'Espaguete com molho de carne',
            price: 35,
            image: 'images/pasta.jpg',
          ),
          MenuItem(
            title: 'Lasanha',
            description: 'Lasanha de carne e queijo',
            price: 50,
            image: 'images/pasta.jpg',
          ),
        ],
      ),
      Category(
        name: 'Bebidas',
        items: [
          MenuItem(
            title: 'Coca-Cola',
            description: 'Refrigerante de cola',
            price: 8,
            image: 'images/cup.jpg',
          ),
          MenuItem(
            title: 'Pepsi',
            description: 'Refrigerante de cola',
            price: 8,
            image: 'images/cup.jpg',
          ),
          MenuItem(
            title: 'Água mineral',
            description: 'Água sem gás',
            price: 4,
            image: 'images/cup.jpg',
          ),
          MenuItem(
            title: 'Suco de laranja',
            description: 'Suco natural de laranja',
            price: 12,
            image: 'images/cup.jpg',
          ),
          MenuItem(
            title: 'Suco de uva',
            description: 'Suco natural de uva',
            price: 12,
            image: 'images/cup.jpg',
          ),
        ],
      )
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Abre hoje às 17h30 - Sem pedido mínimo',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: 2,
              child: Container(
                color: Colors.green,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        category.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ).paddingOnly(top: 20, bottom: 10),
                      MenuCategoryWidget(items: category.items),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
