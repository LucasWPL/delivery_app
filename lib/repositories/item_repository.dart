import 'package:delivery_app/exports.dart';

class ItemRepository {
  final Dio dio;

  ItemRepository({required this.dio});

  final String baseUrl = 'https://sua-api.com/categories';

  Future<dynamic> getDetails() async {
    await Future.delayed(Duration(seconds: 1));

    return {
      "addons": [
        {
          "description": "Escolha de queijos",
          "details": [
            {
              "title": "Mozzarella",
              "description": "Queijo mozzarella fresco",
              "price": 2.50
            },
            {
              "title": "Parmesão",
              "description": "Queijo parmesão ralado",
              "price": 3.00
            },
            {
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
              "title": "Molho de tomate",
              "description": "Molho de tomate caseiro",
              "price": 1.00
            },
            {
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
