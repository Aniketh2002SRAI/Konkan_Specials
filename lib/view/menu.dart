import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:konkanspecials/components/appbar/ks_app_bar.dart';
import 'package:konkanspecials/components/menu/ks_item_block.dart';
import 'package:konkanspecials/constants/constants.dart';
import 'package:konkanspecials/model/items/item_data.dart';
import 'package:konkanspecials/view/homepage.dart';
import 'package:konkanspecials/viewmodel/item_adding_view_model.dart';
import 'package:provider/provider.dart';

class Menu extends StatelessWidget {
  final ItemCategory itemCategory;
  final List<ItemData> items;
  const Menu({super.key, required this.itemCategory, required this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      appBar: ksAppBar(
        titleWidget: Text(
          itemCategory.emoji + '  ' + itemCategory.name,
          style: appBarTitleStyle,
        ),
        leadingIcon: Icons.arrow_back,
        onLeadingIconTap: () {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            final itemAddingViewModel =
                Provider.of<ItemAddingViewModel>(context, listen: false);
            itemAddingViewModel.clearCart();
            Navigator.pop(context);
          });
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _categoryImage(),
          _menuItemsSection(),
        ],
      ),
    );
  }

  Widget _categoryImage() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(10)),
      child: Container(
        height: ScreenUtil().setHeight(200),
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 3,
              spreadRadius: 1,
              offset: Offset(0, 3),
            )
          ],
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(itemCategory.image),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  Widget _menuItemsSection() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
            top: ScreenUtil().setHeight(15),
            left: ScreenUtil().setWidth(15),
            right: ScreenUtil().setWidth(15)),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: items.length,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(10)),
            child: KsItemBlock(
              itemData: items[index],
            ),
          ),
        ),
      ),
    );
  }
}
