import 'package:konkanspecials/model/items/item_data.dart';

class AddToCartModel {
  final ItemData itemData;
  final int quantity;

  AddToCartModel({required this.itemData, required this.quantity});

  @override
  String toString() {
    return 'AddToCartModel(itemData: $itemData, quantity: $quantity)';
  }
}
