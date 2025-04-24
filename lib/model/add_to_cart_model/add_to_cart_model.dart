import 'package:konkanspecials/model/items/item_data.dart';

class AddToCartModel {
  final ItemData itemData;
  final int quantity;

  AddToCartModel({required this.itemData, required this.quantity});

  @override
  String toString() {
    return 'AddToCartModel(itemData: $itemData, quantity: $quantity)';
  }

  factory AddToCartModel.fromJson(Map<String, dynamic> json) {
    return AddToCartModel(
      itemData: ItemData.fromJson(json['itemData']),
      quantity: json['quantity'],
    );
  }
}
