import 'package:flutter/material.dart';
import 'package:konkanspecials/model/add_to_cart_model.dat/add_to_cart_model.dart';
import 'package:konkanspecials/model/items/item_data.dart';

class ItemAddingViewModel extends ChangeNotifier {
  List<AddToCartModel> items = [];

  int getItemQuantity({required String itemId}) {
    final index = items.indexWhere((element) => element.itemData.id == itemId);
    if (index == -1) return 0;
    print('items[index].quantity: ${items[index].quantity}');
    return items[index].quantity;
  }

  int getItemStock({required String itemId}) {
    final index = items.indexWhere((element) => element.itemData.id == itemId);
    if (index == -1) return 0;
    print(
        'items[index].itemData.stock_quantity: ${items[index].itemData.stock_quantity}');
    return items[index].itemData.stock_quantity;
  }

  bool checkItem({required String itemId}) {
    final index = items.indexWhere((element) => element.itemData.id == itemId);
    return index == -1 ? false : true;
  }

  void addItem({required ItemData itemData, required int quantity}) {
    final index =
        items.indexWhere((element) => element.itemData.id == itemData.id);
    if (index != -1) {
      incrementQuantity(itemId: itemData.id);
    } else {
      items.add(AddToCartModel(itemData: itemData, quantity: quantity));
    }
    notifyListeners();
  }

  void decrementQuantity({required String itemId}) {
    final index = items.indexWhere((element) => element.itemData.id == itemId);
    final item = items[index];
    final newQty = item.quantity - 1;
    print('newQty: $newQty');
    items[index] = AddToCartModel(itemData: item.itemData, quantity: newQty);
    notifyListeners();
  }

  void incrementQuantity({required String itemId}) {
    print('incrementQuantity');
    final index = items.indexWhere((element) => element.itemData.id == itemId);
    final item = items[index];
    final newQty = item.quantity + 1;
    items[index] = AddToCartModel(itemData: item.itemData, quantity: newQty);
    notifyListeners();
  }

  bool checkIFItemOutOfStock({required String itemId, required int quantity}) {
    final index = items.indexWhere((element) => element.itemData.id == itemId);
    if (index == -1) return true;
    final item = items[index];
    return quantity++ > item.itemData.stock_quantity ? false : true;
  }

  void deleteItem({required ItemData itemData}) {
    items.removeWhere((element) => element == itemData);
    notifyListeners();
  }

  void clearCart() {
    items.clear();
    notifyListeners();
  }
}
