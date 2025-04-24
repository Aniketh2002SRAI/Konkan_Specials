import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konkanspecials/view/cart.dart';
import 'package:konkanspecials/viewmodel/item_adding_view_model.dart';
import 'package:provider/provider.dart';

class CartDescriptionNavigationWidget extends StatelessWidget {
  const CartDescriptionNavigationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ItemAddingViewModel>(
        builder: (context, itemAddingViewModel, child) {
      return itemAddingViewModel.items.isNotEmpty
          ? Positioned(
              bottom: 0,
              child: _body(
                  context: context, itemAddingViewModel: itemAddingViewModel))
          : const SizedBox.shrink();
    });
  }

  Widget _body(
      {required BuildContext context,
      required ItemAddingViewModel itemAddingViewModel}) {
    final totalQuantity =
        itemAddingViewModel.items.fold(0, (sum, item) => sum + item.quantity);

    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.r), topRight: Radius.circular(10.r)),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Cart()));
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(18)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _cartItemsWidget(totalQuantity),
              SizedBox(width: 10),
              _icon(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _icon() {
    return const Icon(
      Icons.arrow_forward,
      color: Colors.white,
      size: 20,
    );
  }

  Widget _cartItemsWidget(int totalQuantity) {
    return Text(
        '$totalQuantity ${totalQuantity == 1 ? 'item' : 'items'} in cart',
        style: GoogleFonts.shantellSans(
          fontSize: 22,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ));
  }
}
