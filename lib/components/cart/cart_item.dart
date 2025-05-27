import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konkanspecials/components/cart/cart_item_button.dart';
import 'package:konkanspecials/model/add_to_cart_model/add_to_cart_model.dart';

class CartItem extends StatelessWidget {
  final AddToCartModel cartItem;
  final VoidCallback decrementTap;
  final VoidCallback incrementTap;
  const CartItem(
      {super.key,
      required this.cartItem,
      required this.decrementTap,
      required this.incrementTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(10),
        vertical: ScreenUtil().setHeight(15),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
          )
        ],
      ),
      child: Row(
        children: [
          _itemDescription(context: context),
          _itemQuantityPriceWidget(context: context),
        ],
      ),
    );
  }

  Widget _itemDescription({required BuildContext context}) {
    return Expanded(
      child: Container(
        child: Text(cartItem.itemData.name,
            style: GoogleFonts.nunito(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Colors.black,
                letterSpacing: 0.5),
            overflow: TextOverflow.visible,
            maxLines: null),
      ),
    );
  }

  Widget _itemQuantityPriceWidget({required BuildContext context}) {
    return Expanded(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CartItemButton(
                buttonText: cartItem.quantity.toString(),
                decrementTap: decrementTap,
                incrementTap: incrementTap),
            SizedBox(
              width: 15,
            ),
            _priceWidget(),
          ],
        ),
      ),
    );
  }

  Widget _priceWidget() {
    return Text(
        'Rs. ' + (cartItem.quantity * cartItem.itemData.price).toString(),
        style: GoogleFonts.nunito(
            fontSize: 15, fontWeight: FontWeight.w500, color: Colors.green));
  }
}
