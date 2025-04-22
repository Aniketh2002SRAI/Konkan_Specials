import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konkanspecials/components/buttons/ks_order_Add_decrement_button.dart';
import 'package:konkanspecials/components/menu/cached_image.dart';
import 'package:konkanspecials/model/items/item_data.dart';
import 'package:konkanspecials/viewmodel/item_adding_view_model.dart';
import 'package:provider/provider.dart';

class KsItemBlock extends StatelessWidget {
  final ItemData itemData;
  const KsItemBlock({super.key, required this.itemData});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 3,
            spreadRadius: 1,
            offset: Offset(0, 3),
          )
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _descriptionWidget(),
          Spacer(),
          _itemPicAndAddButton(),
        ],
      ),
    );
  }

  Widget _itemPicAndAddButton() {
    return Padding(
      padding: EdgeInsets.only(right: ScreenUtil().setWidth(5.0)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: ScreenUtil().setHeight(5)),
          _itemPic(),
          SizedBox(height: ScreenUtil().setHeight(5)),
          _addButton(),
        ],
      ),
    );
  }

  Widget _addButton() {
    return Transform.translate(
      offset: Offset(0, -15.h),
      child: Consumer<ItemAddingViewModel>(
        builder: (context, itemAddingViewModel, child) {
          int quantity =
              itemAddingViewModel.getItemQuantity(itemId: itemData.id);

          return ksOrderAddDecrementButton(
            shouldShowAddIcon: itemAddingViewModel.checkIFItemOutOfStock(
                itemId: itemData.id, quantity: quantity),
            showIcons: quantity > 0 ? true : false,
            shouldEnable: itemData.stock_quantity > 0,
            borderRadius: 10,
            text: itemAddingViewModel.getItemQuantity(itemId: itemData.id) == 0
                ? 'Add'
                : quantity.toString(),
            addTap: quantity > 0
                ? () {
                    itemAddingViewModel.incrementQuantity(itemId: itemData.id);
                  }
                : () {},
            decrementTap: () =>
                itemAddingViewModel.decrementQuantity(itemId: itemData.id),
            onTap: quantity == 0
                ? () =>
                    itemAddingViewModel.addItem(itemData: itemData, quantity: 1)
                : () {},
          );
        },
      ),
    );
  }

  Widget _itemPic() {
    return Container(
      height: ScreenUtil().setHeight(150),
      width: ScreenUtil().setWidth(150),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedImage(imageUrl: itemData.image_url)),
    );
  }

  Widget _descriptionWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _categoryDifferentiator(),
        _itemTitle(),
        _itemPrice(),
      ],
    );
  }

  Widget _itemPrice() {
    return Padding(
      padding: EdgeInsets.only(
          top: ScreenUtil().setHeight(5), left: ScreenUtil().setWidth(5)),
      child: Text('Rs.' + itemData.price.toString(),
          style: GoogleFonts.nunito(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          )),
    );
  }

  Widget _itemTitle() {
    return Padding(
      padding: EdgeInsets.only(
          top: ScreenUtil().setHeight(35), left: ScreenUtil().setWidth(5)),
      child: Text(itemData.name,
          style: GoogleFonts.nunito(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Colors.black,
              letterSpacing: 0.5)),
    );
  }

  Widget _categoryDifferentiator() {
    return Padding(
      padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(5), top: ScreenUtil().setHeight(10)),
      child: Container(
        height: ScreenUtil().setHeight(20),
        width: ScreenUtil().setWidth(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          border: Border.all(color: Colors.red),
        ),
        child: Padding(
          padding: EdgeInsets.all(2.5),
          child: CircleAvatar(
            radius: 8,
            backgroundColor: Colors.red,
          ),
        ),
      ),
    );
  }
}
