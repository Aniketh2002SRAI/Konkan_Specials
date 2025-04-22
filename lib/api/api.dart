import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:konkanspecials/model/items/item_data.dart';
import 'package:konkanspecials/view/homepage.dart';

class Api {
  static Api instance = Api._();

  Api._();

  String errorMessage = 'Something went wrong';

  final String baseUrl =
      'https://0s9hxdf9ud.execute-api.ap-south-1.amazonaws.com/dev/';

  Future<List<ItemData>?> getItems({required ItemCategory itemCategory}) async {
    try {
      final response = await http.get(Uri.parse(
          '${Api.instance.baseUrl}/api/items?category_id=${getCategoryId(itemCategoty: itemCategory)}'));

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        final List<ItemData> items =
            (jsonData as List).map((item) => ItemData.fromJson(item)).toList();
        ;

        return items;
      } else {
        getErrorMessage(response: response);
        return null;
      }
    } on SocketException catch (e) {
      getErrorMessage(exceptionMessage: "You're offline");
      return null;
    } catch (e) {
    
      getErrorMessage(exceptionMessage: 'Something went wrong');
      return null;
    }
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
      default:
        return '';
    }
  }

  void getErrorMessage({Response? response, String? exceptionMessage}) {
    if (response != null) {
      if (response.statusCode >= 400 && response.statusCode <= 451) {
        errorMessage = 'Something went wrong';
      } else if (response.statusCode >= 500 && response.statusCode <= 599) {
        errorMessage = 'Server error,please try again later';
      }
    } else {
      errorMessage = exceptionMessage!;
    }
  }
}
