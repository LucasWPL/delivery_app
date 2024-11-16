import 'package:delivery_app/exports.dart';

class CategoryRepository {
  final Dio dio;

  CategoryRepository({required this.dio});

  final String baseUrl = 'https://sua-api.com/categories';

  // Mock da resposta da API
  Future<List<Category>> fetchCategories() async {
    await Future.delayed(Duration(seconds: 1));

    final List<dynamic> mockData = [
      {
        "name": "Pizzas",
        "items": [
          {
            "title": "Pizza média (6 pedaços)",
            "description": "Pizza com até 2 sabores e 6 fatias",
            "price": 40,
            "image": "images/pizza.jpg"
          },
          {
            "title": "Pizza pequena (4 pedaços)",
            "description": "Pizza 1 sabor e 4 fatias",
            "price": 30,
            "image": "images/pizza.jpg"
          },
          {
            "title": "Pizza grande (8 pedaços)",
            "description": "Pizza com até 2 sabores e 8 fatias",
            "price": 45,
            "image": "images/pizza.jpg"
          }
        ]
      },
      {
        "name": "Massas",
        "items": [
          {
            "title": "Espaguete à bolonhesa",
            "description": "Espaguete com molho de carne",
            "price": 35,
            "image": "images/pasta.jpg"
          },
          {
            "title": "Lasanha",
            "description": "Lasanha de carne e queijo",
            "price": 50,
            "image": "images/pasta.jpg"
          }
        ]
      },
      {
        "name": "Bebidas",
        "items": [
          {
            "title": "Coca-Cola",
            "description": "Refrigerante de cola",
            "price": 8,
            "image": "images/cup.jpg"
          },
          {
            "title": "Pepsi",
            "description": "Refrigerante de cola",
            "price": 8,
            "image": "images/cup.jpg"
          },
          {
            "title": "Água mineral",
            "description": "Água sem gás",
            "price": 4,
            "image": "images/cup.jpg"
          },
          {
            "title": "Suco de laranja",
            "description": "Suco natural de laranja",
            "price": 12,
            "image": "images/cup.jpg"
          },
          {
            "title": "Suco de uva",
            "description": "Suco natural de uva",
            "price": 12,
            "image": "images/cup.jpg"
          }
        ]
      }
    ];

    List<Category> categories = mockData
        .map((categoryData) => Category.fromJson(categoryData))
        .toList();

    return categories;
  }
}
