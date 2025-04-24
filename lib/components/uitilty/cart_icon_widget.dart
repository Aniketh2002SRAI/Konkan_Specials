import 'package:flutter/material.dart';
import 'package:konkanspecials/view/cart.dart';
import 'package:konkanspecials/viewmodel/item_adding_view_model.dart';
import 'package:provider/provider.dart';

class CartIconWidget extends StatelessWidget {
  const CartIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ItemAddingViewModel>(
        builder: (context, itemViewModel, child) {
      print(itemViewModel.items.length);
      return Stack(children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Cart()),
            );
          },
          child: Icon(
            Icons.shopping_cart_rounded,
            color: Colors.black,
          ),
        ),
        itemViewModel.items.length != 0
            ? Positioned(
                right: 0,
                top: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    radius: 5,
                    backgroundColor: Colors.green,
                  ),
                ),
              )
            : SizedBox.shrink(),
      ]);
    });
  }
}
