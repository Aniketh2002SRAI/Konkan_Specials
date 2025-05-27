import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konkanspecials/components/appbar/ks_app_bar.dart';
import 'package:konkanspecials/components/buttons/ks_app_button.dart';
import 'package:konkanspecials/components/cart/cart_item.dart';
import 'package:konkanspecials/constants/constants.dart';
import 'package:konkanspecials/model/add_to_cart_model/add_to_cart_model.dart';
import 'package:konkanspecials/viewmodel/item_adding_view_model.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ItemAddingViewModel>(
        builder: (context, itemAddingViewModel, child) {
      final items = itemAddingViewModel.items;
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: ksAppBar(
          titleWidget: Text(
            'Cart',
            style: appBarTitleStyle,
          ),
          leadingIcon: Icons.chevron_left,
          onLeadingIconTap: () {
            Navigator.pop(context);
          },
        ),
        body: items.isEmpty
            ? _emptyCartWidget()
            : _body(items: items, itemAddingViewModel: itemAddingViewModel),
      );
    });
  }

  Widget _body(
      {required List<AddToCartModel> items,
      required ItemAddingViewModel itemAddingViewModel}) {
    return Column(
      children: [
        _items(items: items, itemAddingViewModel: itemAddingViewModel),
        _totalCheckoutWidget(items: items),
      ],
    );
  }

  Widget _items(
      {required List<AddToCartModel> items,
      required ItemAddingViewModel itemAddingViewModel}) {
    return Expanded(
      child: ListView.separated(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(10),
            ),
            child: CartItem(
                cartItem: item,
                decrementTap: () {
                  itemAddingViewModel.decrementQuantity(
                      itemId: item.itemData.id);
                },
                incrementTap: () {
                  itemAddingViewModel.incrementQuantity(
                      itemId: item.itemData.id);
                }),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: ScreenUtil().setHeight(5),
          );
        },
      ),
    );
  }

  Widget _totalCheckoutWidget({required List<AddToCartModel> items}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(10),
        vertical: ScreenUtil().setHeight(10),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        children: [
          _totalItemsWidget(items: items),
          SizedBox(height: 8.h),
          _totalAmountWidget(items),
          SizedBox(height: 16.h),
          KsAppButton(
            text: 'Proceed to Checkout',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _totalAmountWidget(List<AddToCartModel> items) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _textWidget(
            text: 'Total Amount:',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black),
        _textWidget(
            text:
                '₹${items.fold(0, (sum, item) => sum + (item.itemData.price * item.quantity))}',
            fontSize: 18,
            fontWeight: FontWeight.w900,
            color: Colors.green),
      ],
    );
  }

  Widget _totalItemsWidget({required List<AddToCartModel> items}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _textWidget(
            text: 'Total Items:',
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Colors.black),
        _textWidget(
            text: '${items.length}',
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Colors.green),
      ],
    );
  }

  Center _emptyCartWidget() {
    return Center(
      child: Text(
        'Your cart is empty',
        style: TextStyle(
          fontSize: 18.sp,
          color: Colors.grey[600],
        ),
      ),
    );
  }

  Widget _textWidget(
      {required String text,
      required double fontSize,
      required FontWeight fontWeight,
      required Color color}) {
    return Text(
      text,
      style: GoogleFonts.nunito(
          fontSize: fontSize, fontWeight: fontWeight, color: color),
    );
  }
}
