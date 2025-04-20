import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:konkanspecials/model/items/item_data.dart';
import 'package:konkanspecials/view/homepage.dart';

class Api {
  static Api instance = Api._();

  Api._();

  final String baseUrl =
      'https://0s9hxdf9ud.execute-api.ap-south-1.amazonaws.com/dev/';

  Future<List<ItemData>> getItems({required ItemCategory itemCategory}) async {
    final response = await http.get(Uri.parse(
        '${Api.instance.baseUrl}/api/items?category_id=${getCategoryId(itemCategoty: itemCategory)}'));

    List<ItemData> items = [];

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      final List<ItemData> items =
          (jsonData as List).map((item) => ItemData.fromJson(item)).toList();
      ;

      return items;
    }
    return [];
  }

  String getCategoryId({required ItemCategory itemCategoty}) {
    switch (itemCategoty) {
      case ItemCategory.fishFry:
        return '111111';
      case ItemCategory.kulukki:
        return '222222';
      case ItemCategory.chilli:
        return '333333';
      case ItemCategory.dietSalad:
        return '';
    }
  }
}
