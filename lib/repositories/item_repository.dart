import 'package:delivery_app/exports.dart';

class ItemRepository {
  final Dio dio;

  ItemRepository({required this.dio});

  final String baseUrl = 'https://sua-api.com/categories';

  Future<dynamic> getDetails() async {
    await Future.delayed(const Duration(seconds: 1));

    return {
      "addons": [
        {
          "description": "Escolha de queijos",
          "details": [
            {
              "id": '1a',
              "title": "Mozzarella",
              "description": "Queijo mozzarella fresco",
              "price": 2.50
            },
            {
              "id": '2a',
              "title": "Parmesão",
              "description": "Queijo parmesão ralado",
              "price": 3.00
            },
            {
              "id": '3a',
              "title": "Cheddar",
              "description": "Queijo cheddar derretido",
              "price": 3.50
            }
          ]
        },
        {
          "description": "Escolha de molhos",
          "details": [
            {
              "id": '4a',
              "title": "Molho de tomate",
              "description": "Molho de tomate caseiro",
              "price": 1.00
            },
            {
              "id": '5a',
              "title": "Molho de alho",
              "description": "Molho de alho picado",
              "price": 1.50
            }
          ]
        }
      ]
    };
  }
}
